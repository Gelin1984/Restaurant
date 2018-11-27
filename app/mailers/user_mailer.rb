class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail( from:email,
      to: 'gregory.dopart@gmail.com',
    subject: "Siemanko Grzesiu! #{name}, #{email}")

  end


  def welcome(user)
    mail(to: user.email, subject: "Welcome")
  end

  def order_placed(user, order)
  	@user = user 
  	@order = order
  	mail(to: user.email, subject: "Thank You")
end
end
