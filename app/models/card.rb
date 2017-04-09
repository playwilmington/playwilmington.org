# frozen_string_literal: true

class Card < ApplicationRecord
  has_attached_file :card_image
  validates_attachment :card_image, presence: true, content_type: {
    content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  }
  validates :order, :size, presence: true

  belongs_to :card_group

  scope :is_active, -> { where(active: true).order(:order) }

  def btn_one_full
    return if btn_one_url.blank?
    "http://" + btn_one_url
  end

  def btn_two_full
    return if btn_two_url.blank?
    "http://" + btn_two_url
  end
end
