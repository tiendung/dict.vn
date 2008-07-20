class FixWordLinks < ActiveRecord::Migration
  def self.up
    #this migration is no longer needed.
    #word-links are already handled in wordnet EE migration
    
    
    #parser = WordnetDictParser.new
    #parser.data_path = "data/seeWn.dict"
    #parser.parse_and_save_result
    #fix_words_that_link_to_another
  end
  
  def self.find_linked_written_form( str )
    str.strip!
    anchor = "(xem)"
    anchor = "(như)" unless str.include?( anchor )
    return nil unless str.starts_with?( anchor )
    return str.split( anchor )[1].lstrip.split(" ")[0]
  end
  
  def self.fix_linking_word( linking_word, linked_written_form )
    source = Word.find(:first, :conditions => ["LOWER(written_form) = ?", linked_written_form.downcase ])
    if source
      linking_word.source_id = source.id
      linking_word.save
    else
      puts "can't not found source word '#{linked_written_form}'"
    end
  end
    
  def self.fix_words_that_link_to_another
    ref_meanings = Meaning.find( 
      :all, 
      :conditions => ["explanation LIKE ? OR explanation LIKE ?", "%(xem)%", "%(như)%"] )

    count = 0
    ref_meanings.each do |meaning|
      if meaning.item.type == Word
        word = meaning.item
        linked_written_form = find_linked_written_form( meaning.explanation )
        if linked_written_form
          count += 1
          puts "\n\n##{count} #{word.written_form}"
          puts meaning.explanation
          puts "#{linked_written_form}"
          fix_linking_word( word, linked_written_form )
        end
      end
    end

  end

  def self.down    
  end
end
