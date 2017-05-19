# frozen_string_literal: true

class Exhibit < ApplicationRecord
  validates :title, :icon, :description, :order, :page_id, presence: true

  belongs_to :page

  scope :is_active, -> { where(active: true).order(:order) }

  def page_name
    return if page_id.blank?
    page.title
  end
end
