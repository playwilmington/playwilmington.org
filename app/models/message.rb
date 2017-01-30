# frozen_string_literal: true
class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :email_to, :message

  validates :name, :email, :email_to, :message, presence: true

end
