class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_confirm_email(user, order)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Order confirmed! ID: #{order.id}")
  end

end
