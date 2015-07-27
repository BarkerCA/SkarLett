class MessageMailer < ApplicationMailer
  name = "SkarLett"
  email = "contact@skar-lett.com"
  default from: %("#{name}" <#{email}>)
  
  def contact_email(contact)
    #
    # contact is an object expected to have the following attributes
    # :name, :email, :subject, :memo
    # 
    @user = contact
    #mail(to: 'amy.campbell@skar-lett.com', cc: 'cassie.barker@skar-lett.com', bcc: 'chris.barker@skar-lett.com', subject: @user.subject.titleize)
    mail(to: 'chris.barker@skar-lett.com', to: 'chris@barker-bunch.us', subject: @user.subject.titleize)
  end
  
  def thankyou_email(contact)
    #
    # contact is an object expected to have the following attributes
    # :name, :email, :subject, :memo
    # 
    @user = contact
    mail(to: @user.email, subject: "Thank You For Contacting SkarLett")
  end
  
end
