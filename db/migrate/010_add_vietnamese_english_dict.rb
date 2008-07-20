require "thieu_ngu/dict_parser"

class AddVietnameseEnglishDict < ActiveRecord::Migration
  
  def self.up
    parser = DictParser.new
    parser.data_path = "data/vietnamese_english.dict"
    parser.source_language = "Vietnamese"
    parser.target_language = "English"
    parser.run
    parser.save_all_results  
  end  
  
  def self.down
  end  
end