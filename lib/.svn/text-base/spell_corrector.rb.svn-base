# @ Author: Brian Adkins
# 10.04.2007 
# http://lojic.com/blog/

class SpellCorrector < ActiveRecord::Base      
  $GLOBAL_NWORDS = nil  
  
  def initialize   
    @count = 0     
    @THRESHOLD = 50000 #max number of steps
    
    File.open("data/nwords.yaml") { |f| $GLOBAL_NWORDS = YAML::load(f) } unless $GLOBAL_NWORDS 
    
    #do not delete
    #this line is to train nwords.yaml
    #$GLOBAL_NWORDS = train(words(File.new("#{RAILS_ROOT}/data/trained_data_for_spell_corrector.txt").read)) unless $GLOBAL_NWORDS 
  
    @NWORDS = $GLOBAL_NWORDS 
    @LETTERS = ("a".."z").to_a.join
  end

  def words text
    text.downcase.scan(/[a-z]+/)
  end

  def train features
    model = Hash.new(1)
    features.each {|f| model [f] += 1 }
    return model 
  end
  
  def get_all_word_written_form    
      features = ""
      Word.find( :all ).each do |word|
        features += word.written_form + " "
      end
      return features.downcase.scan(/[a-z]+/)
  end  
  
  
  def edits1 word
    n = word.length
    deletion = (0...n).collect {|i| word[0...i]+word[i+1..-1] }
    transposition = (0...n-1).collect {
      |i| word[0...i]+word[i+1,1]+word[i,1]+word[i+2..-1] }
    alteration = []
    n.times {|i| @LETTERS.each_byte {
      |l| alteration << word[0...i]+l.chr+word[i+1..-1] } }
    insertion = []
    (n+1).times {|i| @LETTERS.each_byte {
      |l| insertion << word[0...i]+l.chr+word[i..-1] } }
    result = deletion + transposition + alteration + insertion
    result.empty? ? nil : result
  end
  
  def known_edits2 word
    result = []
    edits1(word).each {
      |e1| edits1(e1).each {              
        |e2| result << e2 if @NWORDS.has_key?(e2)
        @count += 1
        if @count > @THRESHOLD
          puts "Too many steps. Break."
          return result.empty? ? nil : result
        end 
      }
    }
    
    puts "after edit2 : " + @count.to_s  
    result.empty? ? nil : result
  end
  
  def known words
    result = words.find_all {|w| @NWORDS.has_key?(w) }
    result.empty? ? nil : result
  end
  
  def correct word    
    @count = 0
    result = nil  
    result = (known([word]) or known(edits1(word)) or known_edits2(word) or 
    [word]).uniq.sort{|a,b| @NWORDS[a] <=> @NWORDS[b] }[0..8]
  end
  
  # @author: dinhhai 20070716
  # to return suggestion words in json format
  def get_suggestion_words_in_json word  
    start = Time.now
    resultArr = correct(word)     
    puts "Running time : " + (Time.now - start).to_s
    
    result = "{wrong_word: \"" + word + "\", suggestion: ["  	
    
    if resultArr.length <= 1 
      # result += "{written_form: \"No suggestions found for this word\"},"	
	  result += "," # For Cutting Later :(
    else    
      resultArr.each do |item|
        suggestion = Suggestion.find_by_written_form(item)
        if suggestion 
          result += "{written_form: \"" + item + "\", summary: \"" + suggestion.summary.gsub(/"/, "&quot;") + "\"},"	
        end        
      end            
    end 
    result = result[0 .. -2]
    result += "]}"
  end 
end