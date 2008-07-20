require "thieu_ngu/wordnet_dict_parser"

class AddWordnetEnglishEnglishDict < ActiveRecord::Migration
  
  def self.up
    parser = WordnetDictParser.new
    parser.data_path = "data/wn.dict"
    parser.parse_and_save_result
  end
  
  def self.down
  end
  
end

