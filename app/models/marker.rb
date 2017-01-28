# frozen_string_literal: true
class Marker < ApplicationRecord
  validates :title, :address, :marker_type, :page_id, presence: true

  belongs_to :page

  scope :museum, -> { where(marker_type: "Museum") }
  scope :parking, -> { where(marker_type: "Parking") }
  scope :food, -> { where(marker_type: "Food") }

  def address_url
    "http://maps.google.com/?" + { q: address }.to_param
  end
end
