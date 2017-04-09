# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  def last_sign_in_pretty
    return if last_sign_in_at.blank?
    last_sign_in_at.in_time_zone(
      "Eastern Time (US & Canada)"
    ).to_formatted_s(:pretty)
  end
end
