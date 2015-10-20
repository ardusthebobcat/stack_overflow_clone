class CustomerMailer < ApplicationMailer
  def deliver_welcome_message(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Stack Overflow #{@user.full_name}")
  end
end
