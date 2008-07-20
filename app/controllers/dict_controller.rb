require "spell_corrector"

class DictController < ApplicationController  
  attr_accessor :word
  

  def index
    return unless params[:query]
    query = params[:query].strip.gsub(/quot;/, "&quot;").gsub(/%20/, " ").downcase         	
    
    hash = Word.find_word( query )
    if hash[:exist]
      add_to_recent_founds( query )
    end
    render :text => hash[:json], :type => "text/javascript"
  end
  
  ##
  # @author Dang Khoa
  # Add to recent founds using word id
  ##
  def add_to_recent_founds( query )
    wordlist = find_wordlist
    wordlist.add_word( query )
    return wordlist
  end
  
  # @author: dinhhai
  # get recent words in session
  def find_wordlist
    session[:wordlist] ||= Wordlist.new
  end

  # @author Dang Khoa + dinhhai
  # This method is to retrieve the error suggestion in Json object
  def error_suggestion    
    word = params[:query]
    sc = SpellCorrector.new
    json_string = sc.get_suggestion_words_in_json( word )
    render :text => json_string, :type => "text/javascript"    
  end
  
  def find_summary	
    query = params[:query].strip.gsub(/quot;/, "&quot;").gsub(/%20/, " ").downcase   
    words = Suggestion.find_by_written_form( query ).to_a
  	if words.size > 0
  		json = "{summary: \"" + words[0].summary + "\"}"
  	else
  		json = "{summary: ''}"
  	end  	
  	render :text => json, :type => "text/javascript"  	
  end

  # @author Dang Khoa + dinhhai
  # To get the list of recent look up words
  def recent_look_ups   	
    @wordlist = find_wordlist    
    if @wordlist 
      jsonStr = @wordlist.get_json
    else
      jsonStr = "{totalCount: 0, suggestions: []}"	    
    end  
    render :text => jsonStr, :type => "text/javascript"    
  end  
  
	
	def find_bookmarklet		
		word = params[:query].strip.downcase
		wordObj = Word.look_up(word)
		
		summary = wordObj.create_summary if wordObj
	
		jsonStr = ""		
		if summary
			jsonStr = "{summary: \"" + summary + "\"}"
		else
			jsonStr = "{summary: ''}"
		end
		
		render :text => "var thieungudata = #{jsonStr};", :type => "text/javascript"  		
	end
end
