# frozen_string_literal: true

class Testimonial < ApplicationRecord
  validates :name, :quote, :status, presence: true

  scope :visable, -> { where(status: "Approved") }
end
