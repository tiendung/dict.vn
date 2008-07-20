# @author: dinhhai
# 20070716
# Purpose: replace all double quotes in thieungu DB by &quot (html)
# note: replace function is not applicable for sqlite  
class ChangeDoubleSingleQuoteToHtmlCode < ActiveRecord::Migration
  def self.up	      
    #meanings table
    Meaning.update_all \
      "explanation = REPLACE(explanation, '\"', '&quot')"

    #examples table
    Example.update_all \
      "explanation = REPLACE(explanation, '\"', '&quot')"
  end 
    
  def self.down    
    #meanings table
    Meaning.update_all \
      "explanation = REPLACE(explanation, '&quot', '\"')"

    #examples table
    Example.update_all \
      "explanation = REPLACE(explanation, '&quot', '\"')"
  end  
end
