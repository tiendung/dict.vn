class GuestbookController < ApplicationController

	def save_guest_book_sign
		
		nickname = params[:nickname]
		subject = params[:subject]
		content = params[:content]
		Guestbook.save_to_db( nickname, subject, content )
	end
	
	def get_data
		
		json = ""
		start = params[:start]
		limit = params[:limit]
		render :text => Guestbook.get_data( start, limit ), :type => "text/javascript" 
				 
	end
end
