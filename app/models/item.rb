require "thieungu_linguistics"

class Item < ActiveRecord::Base
  has_many  :meanings, 
            :dependent => :delete_all,
            :order => "part_of_speech"
            
  has_one   :suggestion

  # validations
  validates_presence_of   :language, :written_form
  validates_inclusion_of  :language, :in => LANGUAGES

  def validate
    if meanings.nil? and source_id.nil? and origion.nil?
      errors.add("item should have meanings or source_id or origin") 
    end
  end


  def to_hash( language = nil )
    hash = { 
      :written_form   => self.written_form,
      :pronunciation  => self.pronunciation,
      :meanings       => []
    }
    meanings = language ? self.meanings.to_a.find_all {|m| m.language == language } : self.meanings
    meanings.each do |meaning|
      hash[ :meanings ] << meaning.to_hash
    end
    return hash
  end

  # return summary of the word for auto suggesstion function
  def create_summary
    summary = "" # dummy code
    count = 0
    self.meanings.each do |meaning|
      summary += meaning.explanation.split(/,|;/)[0]
      summary += "; "
      break if summary.size > 100
    end
    summary + "..." if summary.size > 100
    return summary
  end 
  
  # return {id, written_form} list, sorted by written_form ascending order
  # use for auto suggession 
  # @example list = Item.get_sorted_written_forms
  def self.get_sorted_written_forms
   find_by_sql("SELECT id, LOWER(written_form) as written_form FROM items WHERE (type = 'Word') ORDER BY LOWER(written_form)").to_a.uniq
  end
  
end