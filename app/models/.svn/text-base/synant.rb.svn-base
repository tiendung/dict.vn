class Synant < ActiveRecord::Base
  belongs_to :meaning

  # validations
  # validates_presence_of :written_form 
  
  def to_hash
    return {       
      :synonym  => self.synonym.to_s,
      :antonym  => self.antonym.to_s
    }
  end
end