# frozen_string_literal: true

class Marker < ApplicationRecord
  validates :title, :address, :marker_type, :page_id, presence: true

  belongs_to :page

  def address_url
    "http://maps.google.com/?" + { q: address }.to_param
  end
end
