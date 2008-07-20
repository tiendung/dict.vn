class SpamController < ApplicationController
  def spam
    Spammer.deliver_spam_with_attachment(params[:name],                                      params[:email], params[:file])
    redirect_to :action => "index"
  end
end
