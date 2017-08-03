class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_confirm_email(user, order, cart)
    @user = user
    @url  = 'http://example.com/login'
    @cart = cart
    mail(to: @user.email, subject: "Order confirmed! ID: #{order.id}")
  end

end
