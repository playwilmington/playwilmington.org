# frozen_string_literal: true

class Card < ApplicationRecord
  has_attached_file :card_image
  validates_attachment :card_image, content_type: {
    content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  }
  validates :order, presence: true

  belongs_to :card_group

  scope :is_active, -> { where(active: true).order(:order) }

  def btn_one_full
    if btn_one_url.include? "@"
      "mailto:" + btn_one_url
    elsif !btn_one_url.blank?
      "http://" + btn_one_url
    else
      ""
    end
  end

  def btn_two_full
    if btn_two_url.include? "@"
      "mailto:" + btn_two_url
    elsif !btn_two_url.blank?
      "http://" + btn_two_url
    else
      ""
    end
  end
end
