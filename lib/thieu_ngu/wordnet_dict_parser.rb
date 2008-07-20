class WordnetDictParser
  attr_accessor :data_path, :source_language, :target_language
    
  def parse_and_save_result 
    parse_wn_dict_data_from_text_file( @data_path )
  end  
  
  # parser = WordnetDictParser.new
  # a = parser.parse_wn_dict_data_from_text_file( "E:/wn.dict") 
  def parse_wn_dict_data_from_text_file( filename )    
    wordText = ""
    wordArr = []
    prev_pos = ""
    count = 0
    
    File.open( filename ).each do |line|            
      #break if count > 1000
      begin 
        if line.first_letter != " "     
          parse_word(wordText).save_to_db if wordText.strip.length > 0
          # wordArr << wordText if wordText.strip.length > 0
          # new word begins with a line 
          #without leading blank space        
          wordText = line.strip 
          puts "process : " + wordText  
          
          count += 1
        else     
          # reformat input so that each pos 
          # appear in only 1 line 
          # each pos is separated by @
          # if line begin with "1:" or "2:"... 
          # replace with previous type of pos
          line.strip!              
          # parser.is_pos_begin("adj : having a toe or toes of a specified kind; often used in")
          if line.split[0] == "See"
            wordText +=  "@" + line
          elsif is_pos_begin(line)        
            prev_pos = line.split[0]      
            wordText +=  "@" + line.gsub(/[1]/, "")             
          elsif (is_numeric(line.first_letter) && line.second_letter == ":") 
            line = line[2..-1].strip
            line = prev_pos + " : " + line   
            
            wordText +=  "@"  + line
          elsif (is_numeric(line.two_first_letters) && line.second_letter == ":")
            line = line[3..-1].strip
            line = prev_pos + " : " + line   
            wordText += "@"  + line
          else
            wordText += line + " "           
          end
        end      
      rescue => e
        puts "hmm error in parse_wn_dict_data_from_text_file"
      end 
    end    
    
    parse_word(wordText).save_to_db if wordText.strip.length > 0   
      
  end
  
  
  # parser = WordnetDictParser.new
  # a = parser.parse_wn_dict_data_from_text_file( "D:/test/test.txt") 
  # parser.parse_word(a[0])
  # parser.parse_word(a[1])
  # parser.parse_word(a[2])  
  def parse_word( wordText )
    parts = wordText.split("@")    
    written_form = parts[0]              
    seeArr = []   
    alsoArr = []
    posArr = []    
    parts[1..-1].each do |line|                 
      if is_pos_begin(line)        
        posArr << parse_pos(line)
      elsif line.split[0] == "[also"
        alsoArr = convertToArray(line)
      elsif  line.split[0] == "See"
      	seeArr = convertToArray(line)
      else 
        puts "plz retrofit this unhandled pos case: " + line        
      end          
    end  
    return MyWord.new(written_form, seeArr, posArr, alsoArr)
  end    
  
  # type = also, syn, ant, see
  # parser.convertToArray("See {zip, test, te}")
  def convertToArray(str)
    return [] if str.strip.length == 0
    if str.index("See")
      arr = str.split("{")[1].gsub(/}/,"").split(",")
    else
      arr = str.split(":")[1].gsub(/[\[\]\{\}]/,"").split(",")
    end
    b = []
    arr.each do |t|
      b << t.strip
    end
    return b
  end

  # parser.parse_pos('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')     
  def parse_pos(posText)    
    pos = get_pos_type(posText)
    meanings = get_pos_meaning(posText)
    examples = get_pos_examples(posText)
    syns = get_pos_syns(posText)
    ants = get_pos_ants(posText)    
    return POS.new(pos, meanings, examples, syns, ants)
  end
  
  # parser.get_pos_type('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')   
  def get_pos_type(posText)
    return posText.split[0]
  end
  
  # parser.get_pos_meaning('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')   
  def get_pos_meaning(posText)    
    if posText.index('"') # has examples      
      return posText[0...posText.index('"')].split(':')[1].strip
    elsif posText.index('[') # has syns/ants      
      return posText[0...posText.index('[')].split(':')[1].strip
    else       
      return posText.split(':')[1].strip
    end
  end 
  
  # parser.get_pos_examples('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')
  def get_pos_examples(posText)
    exStr = ""
    if posText.index('"') # has examples         
      if posText.index('[') # has syns/ants      
        exStr =  posText[posText.index('"')...posText.index('[')]
      else 
        exStr =  posText[posText.index('"')..-1]
      end  
    end        
    return [] if exStr.strip.length == 0
    return exStr.gsub(/["]/,"").split(";")       
  end 
  
  # parser.get_pos_syns('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')
  def get_pos_syns(posText)
    synStr = ""
    if posText.index("[syn") 
      if posText.index("[ant")         
        synStr =  posText[posText.index("[syn")...posText.index("[ant")]
      else        
        synStr =  posText[posText.index("[syn")..-1]
      end
    end         
    return convertToArray(synStr) 
  end 
  
  # parser.get_pos_ants('n : small aromatic evergreen shrub leaves and whitish berries; "included in genus Rhus" [syn: {laurel sumac}, {Rhus laurina}] [ant: {not laurel sumac}, {not Rhus laurina}]')
  def get_pos_ants(posText)  
    antStr = ""  
    antStr = posText[posText.index("[ant")..-1] if posText.index("[ant") 
    return convertToArray(antStr) 
  end
  
  def is_pos_begin(line)    
    parts = (line.strip).split    
    posList = ["n", "v", "adj", "adv"]
    return true if parts.length > 0 && posList.index(parts[0]) != nil
    return false
  end
  
  def is_numeric(s)
    begin 
      Float s 
      true
    rescue 
      false 
    end
  end  
end


# @param: also array
# @param: see array
# @param: pos array
class MyWord < ActiveRecord::Migration
  attr_reader :written_form, :seeArr, :alsoArr, :posArr
  
  def initialize(written_form, seeArr, posArr, alsoArr) 
    @written_form = written_form
    @seeArr = seeArr    
    @posArr = posArr 
    @alsoArr = alsoArr 
  end
  
  #handle insertion to db here
  def save_to_db  
    begin 
      puts to_s
                        
      #item table    
      word = Word.find( :first, :conditions => ["lower(written_form) = ?", @written_form.downcase])    
      
      if word == nil   
          word = Word.new(
            :written_form => @written_form,
            :language => "English",
            :type => 'Word'          
          )                 
      end
  
    	if seeArr.length > 0	  
    		source = Word.find( :first, :conditions => ["lower(written_form) = ?", seeArr[0].downcase]) 	
    		word.source_id = source.id if source
    	end  
      
      posArr.each do |pos|      
        # meaning
        meaning = Meaning.new(
          :explanation    => pos.meaning, 
          :language       => "English",
          :part_of_speech => pos.pos
        )    
      
        #thesaurus
        synant = Synant.new(
          :synonym => pos.get_syn_str,
          :antonym => pos.get_ant_str
        )        
        meaning.synants << synant 
        
        #example
        pos.examples.each do |ex|
          example = Example.new(
            :written_form => ex.strip,
            :explanation  => "nil"
          )        
          meaning.examples << example         
        end                 
        
        word.meanings << meaning    
      end                   
     
      word.save
    rescue => e
      puts "error in saving to database : " +  to_s 
    end  
    
  end
  
  def to_s
    see = ""
    @seeArr.each do |p|
      see += p.to_s + "\n"
    end
    
    pos = "";
    @posArr.each do |p|
      pos += p.to_s + "\n"
    end
    also = ""
    @alsoArr.each do |a|
      also += a + ", "
    end
    see = ""
    @seeArr.each do |a|
      see += a + ", "
    end
    
    result = "written_form: " + @written_form + "\n" 
    result += "pos: " + pos + "\n" if pos.length > 0
    result += "also: " + also if also.length > 0    
    result += "see: " + see if see.length > 0    
    return result       
  end
end


# @param: POS type: n, v, adj, adv
# @param: meaning 
# @param: Array of examples
# @param: Array of syns 
# @param: Array of ants
class POS
  #attr_accessor :data_path, :source_language, :target_language, :limit, :words
  attr_reader :pos, :meaning, :examples, :syns, :ants

  def map_pos(pos)
    return "noun" if pos == "n"
    return "verb" if pos == "v" 
    return "unknown"   
  end
        
  def initialize(pos, meaning, examples, syns, ants)     
    @pos = map_pos(pos)
    @meaning = meaning 
    @examples = examples
    @syns = syns
    @ants = ants  
  end
  
  def get_syn_str
    syn = ""
    @syns.each do |s|
      syn += s + ";"
    end
    return syn
  end
  
  def get_ant_str
    ant = ""
    @ants.each do |s|
      ant += s + ";"
    end
    return ant
  end
  
  
  def to_s
    example = ""
    @examples.each do |e|
      example += e + "; "
    end
    syn = ""
    @syns.each do |s|
      syn += s + "; "
    end
    ant = ""
    @ants.each do |a|
      ant += a + "; "
    end
    result = "pos type: " + pos + "\n" + "meaning: " + meaning + "\n"
    result += "examples: " + example + "\n" if example.length > 0
    result += "syns: " + syn + "\n" if syn.length > 0
    result += "ants: " + ant + "\n" if ant.length > 0   
    return result 
  end
end 

class String
  def first_letter
    return self[0, 1]
  end
    
  def second_letter
    return self[1, 1]
  end
  
  def third_letter
    return self[2, 1]
  end
  
  def two_first_letters
    return self[0, 2]
  end
end