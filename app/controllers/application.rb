# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_server_session_id'
  
  protected 
  
  # set all requests to be public request. 
  # So that the server will throw error as in real production.
  def local_request?
	false
  end
  
  # redirect to specific error message
  def rescue_action_in_public(exception)
	case exception 
		when ActiveRecord::RecordNotFound
			render :file => "#{RAILS_ROOT}/public/404.html", :status => 404	
		else
			super
		end
	end		
end
