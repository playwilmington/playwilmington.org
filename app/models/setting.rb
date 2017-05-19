# frozen_string_literal: true

class Setting < ApplicationRecord
  validates :company_name, :copyright, presence: true

  def map_url
    "http://maps.google.com/?" + { q: address }.to_param
  end

  def tel_format
    "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..9]}"
  end

  def tel_url
    return unless phone
    "tel:" + phone
  end

  def email_url
    return unless email
    "mailto:" + email
  end

  def facebook_url
    return unless facebook_handle.present?
    "https://www.facebook.com/" + facebook_handle
  end

  def twitter_url
    return unless twitter_handle.present?
    "https://twitter.com/" + twitter_handle
  end

  def pinterest_url
    return unless pinterest_handle.present?
    "https://www.pinterest.com/" + pinterest_handle
  end

  def instagram_url
    return unless instagram_handle.present?
    "https://instagram.com/" + instagram_handle
  end
end
