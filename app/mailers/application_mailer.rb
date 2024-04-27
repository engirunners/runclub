# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(Rails.application.credentials.mailer.user_name, 'Engirunners')
  layout 'mailer'
end
