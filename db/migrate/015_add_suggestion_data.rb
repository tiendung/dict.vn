class AddSuggestionData < ActiveRecord::Migration
  def self.up
    count = 0
    Word.get_sorted_written_forms.each do |item|
      begin 
        count += 1
        summary = item.create_summary
        if summary.size > 0
          puts "processing #{count}: #{item.written_form}\n#{summary}\n"
          Suggestion.create( 
            :written_form => item.written_form, 
            :summary      => summary, 
            :item_id      => item.id )
        end
      rescue => e
        puts e
      end
    end
  end

  def self.down
    Suggestion.delete_all
  end
end
