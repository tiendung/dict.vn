class AddCacheData < ActiveRecord::Migration

  def self.up
  	written_forms = Word.get_sorted_written_forms
    puts "begin add cache data for #{written_forms.size} items"
  	written_forms.each  do |word|
		begin
  		  query = word.written_form
  		  puts query
        Cache.create( :written_form => query, :json => Word.look_up( query ) )
  		rescue => e
  			puts "error in AddCacheData : " + e
  		end
  	end
  end

  def self.down
    #Cache.delete_all
  end

end
