# frozen_string_literal: true

class Testimonial < ApplicationRecord
  validates :name, :quote, :status, presence: true

  scope :visible, -> { where(status: "Approved") }

  scope :dashboard, -> { where("status = ? OR status = ?", "New", "Pending") }
end
