class SuggestController < ApplicationController
  def index
    written_form = params[:query]
    start = params[:start]
    written_form = written_form.gsub(/quot;/, "&quot;")
    start = "1"
    pageSize = 6
    suggestion = Suggestion.suggest( written_form, start, pageSize, 10 ) if written_form
    render :text => suggestion , :type => "text/javascript"
  end  
end
