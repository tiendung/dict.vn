class Cache < ActiveRecord::Base
  
  def self.search( query ) 
    return find( :all, :select => 'id, written_form', :conditions => ["LOWER(written_form) = ?", query ]).delete_if { |c| c.written_form != query }	
  end
  
	def self.search_with_english_postfix( query )
	  query.downcase!       
    caches = search( query )
		['s','es','d','ed','ing'].each do |tail|
		  break if caches.length > 0
		  index = -tail.length
		  caches = search( query[0..index-1] ) if query[index..-1] == tail
		end
		return Cache.find( caches[0].id ) if caches.length > 0
	end
end
