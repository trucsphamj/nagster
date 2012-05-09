class MemberMailer < ActionMailer::Base
  default :from => "nagsterNoReply@gmail.com"
 
  def welcome_email(member)
    @member = member
    @url  = "http://http://nagster.heroku.com/signin"
    mail(:to => member.email, :subject => "Welcome to Nagster")
  end
end