require "thieu_ngu/dict_parser"

class AddEnglishVietnameseDictionary < ActiveRecord::Migration
  
  def self.up
    parser = DictParser.new
    parser.data_path = "data/english_vietnamese.dict"
    parser.source_language = "English"
    parser.target_language = "Vietnamese"
    parser.run
    parser.save_all_results
  end
  
  def self.down
  end
  
end