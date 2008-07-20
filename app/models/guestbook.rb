class Guestbook < ActiveRecord::Base
	def to_hash
		return { 
			:entryid => self.id,
			:visitor  => self.visitor,
			:subject => self.subject,
			:content => self.content,
			:recordTime => self.recordTime
		}
		
	end
	
	# Static method
	def self.save_to_db ( visitor, subject, content )
				
		recordTime = Time.now.to_s
		entry = Guestbook.new(
            :visitor => visitor,
            :subject => subject,
            :content => content,
			:recordTime => recordTime
        )            	
		
		entry.save
	end
	
	# Author: Dang Khoa
	def self.get_data ( start, limit ) 
		
		totalEntries = find(:all).length
				
		jsonStr = "{totalCount: #{totalEntries}, entries: ["
		
		guestbookEntries = find(  :all, :order => "id DESC",
			:conditions => ["id <= ?", (totalEntries - start.to_i).to_s],
            :limit => limit
        ) 
		
		hasEntry = 1
		guestbookEntries.each do | anEntry |
			jsonStr += anEntry.to_hash.to_json + ","
			hasEntry = 2
		end
		
		return jsonStr[0..-hasEntry] + "]}"
	end
end