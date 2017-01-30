# frozen_string_literal: true
class MessageMailer < ActionMailer::Base

  def new_message(message)
    @message = message

    mail to: message.email_to.to_s
    mail from: message.email.to_s
    mail subject: "Message from #{message.name}"
  end
end
