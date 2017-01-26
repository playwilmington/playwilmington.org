# frozen_string_literal: true
class Slider < ApplicationRecord
  has_attached_file :photo
  validates_attachment :photo, presence: true, content_type: {
    content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  }
  validates :order, presence: true
  validates_inclusion_of :position,
                         in: %w('' center-align left-alight right-align),
                         message: "Poistion %{value} is not an option"
  scope :visable, -> { where(active: true).order(:order) }
end
