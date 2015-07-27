class ApplicationMailer < ActionMailer::Base
  name = "SkarLett"
  email = "contact@skar-lett.com"
  default from: %("#{name}" <#{email}>)
  layout 'mailer'
end
