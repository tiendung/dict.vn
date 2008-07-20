class Word < Item
  has_and_belongs_to_many :idioms
  has_one :json, :as => :resource
  
  # return words of a given written_form
  # @params String
  def self.search( query )
    query.downcase!
    return find( :all, :conditions => ["LOWER(written_form) = ?", query ]).to_a.
    find_all { |word| word.written_form == query }
  end

  def idioms_hash
    {:idioms => self.idioms.inject([]) {|a, idiom| a << idiom.to_hash} }
  end
  
  def thesaurus_hash
    hash = {
      :word => self.written_form,
      :synonym => [],
      :antonym => []
    }

    def str_to_array( str )
      str.split(";").inject([]) {|a, c| a << {:written_form => c} }
    end
  
    self.meanings.each do |meaning|
      ant_hash = { :meaning => meaning.explanation, :word_list => [] }
      syn_hash = { :meaning => meaning.explanation, :word_list => [] }
      meaning.synants.each do |synant|        
        ant_hash[ :word_list ] += str_to_array( synant.antonym )
        syn_hash[ :word_list ] += str_to_array( synant.synonym )
      end
        hash[:synonym] << syn_hash
        hash[:antonym] << ant_hash
    end            
    hash
  end
	
	def self.search_with_english_postfix( query )
	  query.downcase!           
		words = self.search( query )
		['s','es','d','ed','ing'].each do |tail|
		  break if words.size > 0
		  index = -tail.length
		  words = self.search( query[0..index-1] ) if query[index..-1] == tail
		end
		words
	end

  ##
  # @author Dang Khoa
  # Wrap 2 methods lookup and build_json_string_if_no_cache 
  # to let recent words to word
  # Returned value is a hash with 2 keys exist and json
  ##
  def self.find_word( query )
    
   hash = {:exist => false, :json => ""}
   cache = self.look_up( query )
   if not cache.nil?
     hash[:json] = cache.json
     hash[:exist] = true
   else
    json_hash = self.build_json_string_if_no_cache( query )
    hash[:json] = json_hash.to_json
    if json_hash[:ve_dict].id != -1 or json_hash[:ee_dict].id != -1 or json_hash[:ev_dict].id != -1
      hash[:exist] = true
    end
   end
   
   return hash
  end
  
	def self.look_up( query )
	  # using cache
	  cache = Cache.search_with_english_postfix( query )
	  if cache
      return cache 
    else
      return nil
    end
	end

  def self.build_json_string_if_no_cache( query )
    
    words = self.search_with_english_postfix( query.downcase )
    
    empty = { :id => -1, :written_form => query, :pronunciation => "" }
    hash = { :ve_dict => empty, :ev_dict => empty, :ee_dict => empty, :idioms => [], :thesaurus => {} }
    words.each do |word|
      if word.language == "Vietnamese"
        hash[ :ve_dict ] = word.to_hash
      else
        hash[ :ev_dict ] = word.to_hash("Vietnamese")
        hash[ :ee_dict ] = word.to_hash("English")
        hash[ :idioms ] = word.idioms_hash
        hash[ :thesaurus ] = word.thesaurus_hash
      end
    end
    return hash  
  end
end
