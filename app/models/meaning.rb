require "thieu_ngu/linguistics"

class Meaning < ActiveRecord::Base
  has_many    :examples, :dependent => :delete_all
  has_many    :synants, :dependent => :delete_all
  belongs_to  :item
  
  # validations
  validates_presence_of   :language, :explanation, :part_of_speech
  validates_inclusion_of  :language, :in => LANGUAGES

  def to_hash
    pos = self.part_of_speech
    hash = {
      :explanation    => self.explanation,
      :part_of_speech_vn => pos && POS_TAG_VI_NAMES[ pos.to_sym ],
      :part_of_speech_e => pos,
      :examples       => []
    }
    self.examples.each do |example|
      hash[:examples] << example.to_hash
    end
    hash
  end
  
 
end
