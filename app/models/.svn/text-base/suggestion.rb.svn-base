class Suggestion < ActiveRecord::Base
  belongs_to :item

  # validations
  validates_presence_of   :written_form, :summary
  def validate
    if item.type != Word
      errors.add("suggestion's item must is a word") 
    end
  end
  
  # @author dungtn & dangkhoa
  # written_form: string
  # start: string
  # pageSize: int
  # limit: int
  # @return: json string represents the suggestion 
  def self.suggest( written_form, start, pageSize, limit )
    find_options = { 
      :conditions => ["written_form LIKE ?", written_form.downcase + '%' ], 
      :limit      => limit,
      :select     => "DISTINCT written_form, summary"
    }
    list = []
    returnedStr = "";
    if start == "1"
      st = 1
    else
      st = 1 + pageSize
    end
    
    count = 0;
    find(:all, find_options).each do |suggestion|
      # list << suggestion.to_hash
     
      if count >= (st - 1) && count < st * pageSize
        returnedStr += "{\"suggestion_id\": " + (count + 1).to_s + ", \"written_form\": \"" + suggestion.written_form.gsub(/"/, "&quot;") + "\", \"summary\": \"" + suggestion.summary.gsub(/"/, "&quot;") + "\"},"
      end
      count = count + 1
    end
    
    returnedStr = "{ \"totalCount\": " + count.to_s + ", \"suggestions\": " + "[" + returnedStr[0..-2] + "]" + "}"
    # return list.to_json
    return returnedStr
  end

  def to_hash
    hash = {
      :written_form => self.written_form,
      :summary      => self.summary
    }
    return hash
  end
  
  def get_json
    self.to_hash.to_json
  end
  
  def self.find_by_written_form(written_form)
    result = nil 
    
		self.find(:all, :select => "DISTINCT written_form, summary", :conditions => ["written_form = ?", written_form]).each do |s|
			result = s if s.written_form == written_form
			break
		end		
		
		result = self.find_by_written_form(written_form[0..-2]) if !result && written_form[-1..-1] == 's'
    
    result = self.find_by_written_form(written_form[0..-3]) if !result && written_form[-2..-1] == 'es' 
    
    result = self.find_by_written_form(written_form[0..-2]) if !result && written_form[-1..-1] == 'd'
    
    result = self.find_by_written_form(query[0..-3]) if !result && written_form[-2..-1] == 'ed' 
    
		return result
  end
end
