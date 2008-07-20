class Wordlist
  attr :wordlist
  
  def initialize
    @wordlist = []
  end
  
  def add_word( written_form )
		#suggestion = Suggestion.find_by_written_form(word)	
    @wordlist << written_form unless @wordlist.find{ |word| word == written_form} 
  end  
  
  def get_json
  	count = 0
  	maxLength = 6
  	jsonStr = ""
    @wordlist = @wordlist[-maxLength..-1] if @wordlist.length > maxLength
    length = @wordlist.length      
    @wordlist.each do |written_form|               
  		suggestion_list = Suggestion.find(:all, :select => "DISTINCT written_form, summary", :conditions => {:written_form => written_form})	 
      
      suggestion_list.each do |a_suggestion|
        if a_suggestion.written_form == written_form
          jsonStr += "{suggestion_id: " + (count + 1).to_s + ", written_form: \"" + a_suggestion.written_form + "\", summary: \"" + a_suggestion.summary.gsub(/"/, "&quot;") + "\"},"
          count = count + 1  
        end
      end
      
    end
    jsonStr = "{ totalCount: " + count.to_s + ", suggestions: " + "[" + jsonStr[0..-2] + "]" + "}"	
  end
  
end