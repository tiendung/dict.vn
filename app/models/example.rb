class Example < ActiveRecord::Base
  belongs_to :meaning

  # validations
  validates_presence_of :written_form, :explanation
  
  def to_hash
    return { 
      :written_form => self.written_form,
      :explanation  => self.explanation
    }
  end
end
