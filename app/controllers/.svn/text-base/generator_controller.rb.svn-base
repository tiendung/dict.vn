class GeneratorController < ApplicationController  
  # This function is used to map page index with this function
  def index    
    word_written_form = @params[:query].downcase
    
    # This parameter node is defined internally by Ext Library
    nodeId = @params[:node]
    
    if (nodeId == "source")
       render :text => find_meanings_of_word( word_written_form ) , :type => "text/javascript"
       return
    end
    
    # Note: Can be enhanced using REST
    if (nodeId != "source" && nodeId != nil)
       render :text => find_examples_of_meaning( nodeId ) , :type => "text/javascript"
    end  
  end


  def lookup_error_suggestion    
    wrong_word = @params[:word]    
    render :text => "{wrong_word: \"" + wrong_word.gsub(/quot;/, "&quot;") + "\", suggestion: [{written_form: \"help\"}, {written_form: \"what\"}, {written_form: \"hello\"}, {written_form: \"alright\"}]}", :type => "text/javascript"
  end
  
  
  # This function is used to map page index with this function
  def search_word_idioms    
    word_written_form = @params[:query].downcase
  
    # This parameter node is defined internally by Ext Library
    nodeId = @params[:node]
    
    if (nodeId == "idiom_source")
       render :text => find_idioms_of_word( word_written_form ) , :type => "text/javascript"
       return
    end
    
    # Note: Can be enhanced using REST
    if (nodeId != "idiom_source" && nodeId != nil)
       render :text => find_meanings_of_idiom( nodeId ) , :type => "text/javascript"
    end
  end
   
   
  # This function is used to find all meanings of a word given its written form
  # The result will be converted into an array in Javascript to be in matched with Ext predefined form
  # so that it can be displayed in the Ext Tree 
  def find_meanings_of_word(word_written_form)     
    @word = Word.find( :first, :conditions => ["written_form = ?", word_written_form ] );
    arrayOfWordMeanings = "[";
    
    if ( @word == nil )
      arrayOfWordMeanings += "{ \"id\": 0, \"text\": \"Word cannot be found\", \"leaf\": true}]" 
      return arrayOfWordMeanings
    end
     
    @word.meanings.each do |meaning|
      if (meaning.examples.size != 0)
         arrayOfWordMeanings += "{ \"id\": " + meaning.id.to_s + ", " + "\"text\": " + "\"" + meaning.explanation.gsub(/"/, "'") + "\", \"leaf\": false, qtip: \"" + build_quick_tips_for_word_meaning( meaning.id ) + "\", icon: \"" + retrieve_part_of_speech_image(meaning) + "\"},"
      else
         arrayOfWordMeanings += "{ \"id\": " + meaning.id.to_s + ", " + "\"text\": " + "\"" + meaning.explanation.gsub(/"/, "'") + "\", \"leaf\": true, qtip: \"" + build_quick_tips_for_word_meaning( meaning.id ) + "\", icon: \"" + retrieve_part_of_speech_image(meaning)+ "\"},"
  
      end
    end
        
    arrayOfWordMeanings = arrayOfWordMeanings[0..-2]
    arrayOfWordMeanings += "]";    
    return arrayOfWordMeanings    
  end
  # end find_meanings_of_word
  
  
  # This function is used meaning to retrieve coresponding part of speech image for the purpose of displaying
  def retrieve_part_of_speech_image(meaning)     
    # TODO: Find the POS of meaning and decide on part of speech of image
    pos = meaning.part_of_speech
    case pos   
      when "adverb"     
        return "../images/icons/word_type/folder_feed.png" 
      when "conjunction"
        return "../images/icons/word_type/folder_heart.png"
      when "pronoun"
        return "../images/icons/word_type/folder_lightbulb.png"            
      else  
        return "../images/icons/word_type/folder_page.png"
    end 
  end
  
  # This function is used to find all examples of a meaning given its id
  # The result will be converted into an array in Javascript to be in matched with Ext predefined form
  # so that it can be displayed in the Ext Tree 
  def find_examples_of_meaning(meaningId)  
    arrayOfExamples = "["
    @meanings = Meaning.find( :first, :conditions => ["id = ?", meaningId ] );    
    @meanings.examples.each do |t|
      arrayOfExamples += "{ \"id\": " + t.id.to_s + ", " + "\"text\": " + "\"" + t.written_form.gsub(/"/, "'") + "\", \"leaf\": true, icon: \"../images/icons/page_world.png\"},";    
    end          
    return arrayOfExamples[0..-2] + "]" 
  end
  # end find_examples_of_meaning
  
  
  # This function is used to find all examples of a meaning given its id
  # The result will be converted into an array in Javascript to be displayed
  # as quick tip 
  def build_quick_tips_for_word_meaning(meaningId)     
    @meanings = Meaning.find( :first, :conditions => ["id = ?", meaningId ] );
    quick_tips = "<b>" + @meanings.explanation.gsub(/"/, "'") + "</b><br /><br />"
        
    if (@meanings.examples.size == 0)
      quick_tips += "<i>No example of this meaning is availabe at this moment</i>"
      return quick_tips
    end
        
    @meanings.examples.each do |example|
      quick_tips += "<li><i><font color = 'blue'>" + example.written_form.gsub(/"/, "'") + "</font></i><br/>"
      quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
      quick_tips += "" + example.explanation.gsub(/"/, "'") + ""
      quick_tips += "</li><br/>"
    end    
    return quick_tips + ""    
  end
  
  # This function is used to find all idioms of a word given its written form
  # The result will be converted into an array in Javascript to be in matched with Ext predefined form
  # so that it can be displayed in the Ext Tree 
  def find_idioms_of_word( word_written_form )     
    @word = Word.find( :first, :conditions => ["written_form = ?", word_written_form ] );
    arrayOfWordIdioms = "[";
    
    if ( @word == nil )
      arrayOfWordIdioms += "{ \"id\": 0, \"text\": \"Word cannot be found\", \"leaf\": true}]" 
      return arrayOfWordIdioms
    end
     
    @word.idioms.each do |idiom|
      if (idiom.meanings.size != 0)
         arrayOfWordIdioms += "{ \"id\": " + idiom.id.to_s + ", " + "\"text\": " + "\"" + idiom.written_form.gsub(/"/, "'") + "\", \"leaf\": false, qtip: \"" + build_quick_tips_for_idiom( idiom.id ) + "\"},"
      else
         arrayOfWordIdioms += "{ \"id\": " + idiom.id.to_s + ", " + "\"text\": " + "\"" + idiom.written_form.gsub(/"/, "'") + "\", \"leaf\": true, qtip: \"" + build_quick_tips_for_idiom( idiom.id ) + "\"},"  
      end
    end        
    return arrayOfWordIdioms[0..-2] + "]" 
  end
  # end find_idioms_of_word
  
  
  
  # This function is used to find all examples of a meaning given its id
  # The result will be converted into an array in Javascript to be in matched with Ext predefined form
  # so that it can be displayed in the Ext Tree 
  def find_meanings_of_idiom(idiomId)  
    arrayOfMeanings = "["
    @idiom = Idiom.find( :first, :conditions => ["id = ?", idiomId] )
    
    @idiom.meanings.each do |meaning|
      arrayOfMeanings += "{ \"id\": " + meaning.id.to_s + ", " + "\"text\": " + "\"" + meaning.explanation.gsub(/"/, "'") + "\", \"leaf\": true},"
    end
      
    return arrayOfMeanings[0..-2] + "]"
  
  end
  # end find_meanings_of_idiom
  
  
  
  # This function is used to find all meanings of an idiom using its id
  # The result will be converted into an array in Javascript to be displayed
  # as quick tip 
  def build_quick_tips_for_idiom ( idiomId )     
    @idiom = Idiom.find( :first, :conditions => ["id = ?", idiomId ] )
    quick_tips = "<b>" + @idiom.written_form.gsub(/"/, "'") + "</b></br>"
    quick_tips += "<br/>"
    
    if (@idiom.meanings.size == 0)
      quick_tips += "<i>No meaning of this idiom is availabe at this moment</i>"
      return quick_tips
    end
            
    @idiom.meanings.each do |meaning|
      quick_tips += "<li><b><font color = 'green'>" + meaning.explanation.gsub(/"/, "'") + "</font></b>"      
      
      if (meaning.examples.size > 0)
        quick_tips += "<br/><br/>"
        quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
      end
      
      meaning.examples.each do |example|
        quick_tips += "<font color = 'blue'><i> - " + example.written_form.gsub(/"/, "'") + "</i></font><br/>"
        quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
        quick_tips += "" + example.explanation.gsub(/"/, "'") + "<br/>"
        quick_tips += "</li><br/>"
      end
    end
    
    return quick_tips + ""    
  end  
end
