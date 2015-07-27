class ApplicationMailer < ActionMailer::Base
  name = "Skar&#x2764;Lett"
  email = "contact@skar-lett.com"
  default from: %("#{name}" <#{email}>)
  layout 'mailer'
end
