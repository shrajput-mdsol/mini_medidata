class ApplicationMailer < ActionMailer::Base
  default from: 'test.for.my.training.email@gmail.com'
  layout 'mailer'
end
