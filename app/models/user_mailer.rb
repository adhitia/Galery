class UserMailer < ActionMailer::Base
  def invite_person(user, password)
    setup_email(user)
    @subject    += 'Come and View My Galery'
  
    @body[:url]  = "http://www/tehis.url" 
    @body[:password] = password
  
  end

  protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "no_reply"
    @subject     = "Invitation"
    @sent_on     = Time.now
    @body[:user] = user
  end
end
