# frozen_string_literal: true
class Photo < ApplicationRecord
  has_attached_file :image
  validates_attachment :image, presence: true, content_type: {
    content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  }

  belongs_to :photo_album
end
