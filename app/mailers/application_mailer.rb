# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@playwilmington.org"
  layout "mailer"
end
