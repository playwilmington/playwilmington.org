# frozen_string_literal: true
class Setting < ApplicationRecord
  validates :company_name, :copyright, presence: true

  def map_url
    "http://maps.google.com/?" + { q: address }.to_param
  end

  def tel_format
    "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..9]}"
  end

  def facebook_url
    "https://www.facebook.com/" + facebook_handle
  end

  def twitter_url
    "https://twitter.com/" + twitter_handle
  end

  def pinterest_url
    "https://www.pinterest.com/" + pinterest_handle
  end

  def instagram_url
    "https://instagram.com/" + instagram_handle
  end
end
