class UserMailer < ActionMailer::Base
  default from: "mikesdesignbuild@gmail.com"

  def welcome_email # (user)
    @user = { email: "mikesdesignbuild@gmail.com", name:"Mike" }
    @url  = 'http://example.com/login'
    mail(to: "mikesdesignbuild@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
