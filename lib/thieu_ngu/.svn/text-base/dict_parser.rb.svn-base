# 20070606
# dungtn@gmail.com
#-------------------------------------------------------------------
# convert English-Vietnamese Dictionary in DICT.org format to 
# relational database
#-------------------------------------------------------------------
require "thieu_ngu/linguistics"

#add first_letter method to String class
class String
  def first_letter
    return self[0, 1]
  end
end

class DictParser < ActiveRecord::Migration
  
  attr_accessor :data_path, :source_language, :target_language, :limit, :words
  
  PARSE_METHOD_MAPPING = {
    "*" => :parse_part_of_speech,
    "-" => :parse_meaning,
    "=" => :parse_example,
    "!" => :parse_idiom,
    "@" => :parse_word
  }

  def initialize
    @limit = nil
    @words = []
  end

  def init_item_related_variables
    @meaning = nil
    @idiom = nil
    @pos_tag = nil
    @word = Word.new( :language => @source_language )
  end
  
  def parse_dict_item( str )
    init_item_related_variables
    str.each do |line|
      return nil if parse_line( line ) != 0
    end
    return @word
  end

  def parse_line( line )
    method = PARSE_METHOD_MAPPING[ line.first_letter ]
    return send( method, line ) if method
    #show warning and continue if do not found corresponding method
    puts "[warning 01] has an unknown line\n" + line 
    return 0
  end

  def parse_part_of_speech( line )
    begin
      if source_language == 'English'
        @pos_tag = get_pos_tag( line ).to_s
	    else
	      @pos_tag = line.gsub(/\*/, "").strip
      end
      
      #puts "processing POS: " + @pos_tag + " " + line   
    rescue => e
      @pos_tag = ":unknown"
    end
    
    @idiom = nil
    @meaning = nil
    return 0
  end
  
  def parse_meaning( line )
    @meaning = Meaning.new(
      :explanation    => line.sub("-"," ").strip, 
      :language       => @target_language,
      :part_of_speech => @pos_tag )
    ( @idiom || @word ).meanings << @meaning
    return 0
  end
  
  def parse_example( line )
    begin 
      if not @meaning
        #show error and stop parsing
        puts "[error 01] has an example locating before meanings or idioms\n" + line
        return 1
      end
      
      parts = line.sub("="," ").split("+")
      
      if parts.length == 2
        writ = parts[0].strip
        expl = parts[1].strip
      else
        writ = parts[0].strip
        expl = ""
      end
      
      @meaning.examples << Example.new(
        :written_form => writ,
        :explanation  => expl)
    rescue => e
      puts "Error in parsing example:" + line + "\nException: " + e
    end
    return 0
  end

  def parse_idiom( line )
    @meaning = nil
    @idiom = Idiom.new( 
      :written_form => line.sub("!"," ").strip,
      :language     => @source_language )
    @word.idioms << @idiom
    return 0
  end

  def parse_word( line )
    parts = line.sub("@"," ").split("/")
    puts "@" + @word.written_form  = parts[0].strip
    
    if Word.find_by_written_form(@word.written_form, 'VE_DICT') || Word.find_by_written_form(@word.written_form, 'EV_DICT')
      puts "[error 02] word is already added.\n"
      return 2;
    end
    
    @word.pronunciation = parts[1].strip if parts[1]
    return 0
  end

  def load_dict_data_from_text_file( filename )
    text = ""
    File.open( filename ).each do |line|
      line.strip!
      text << line + "\n" if line.length > 1
    end
    return text
  end

  def run
    text_words = load_dict_data_from_text_file( @data_path ).split("\n@")
    text_words.delete_at(0)

    count = 0
    text_words.each do |text_word| 
      begin 
        if @limit == nil || count <= @limit
          #puts "\nprocessing ##{ count += 1 }"
          
          @words << parse_dict_item( "@" + text_word ) 
        end
      rescue => e
        puts "Text_word: " + text_word + "\nException: " + e
      end
    end
  end
  
  def save_all_results
    @words.each do |word|
      word.save if word != nil
    end
  end
  
end