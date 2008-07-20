class Spammer < ActionMailer::Base
  def spam_with_attachment(name, email, file)
    @subject    = 'Have a Can of Spam!'
    @body       = {:name => name}
    @recipients = email
    @from       = 'spam@chadfowler.com'
    unless file.blank?
      attachment :body => file.read, :filename => file.original_filename 
    end
  end
end
