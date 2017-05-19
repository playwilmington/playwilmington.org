# frozen_string_literal: true

class ContactEmail < ApplicationRecord
  validates :title, :email_address, :page_id, :order, presence: true

  belongs_to :page

  scope :is_active, -> { where(active: true).order(:order) }

  def page_name
    return if page_id.blank?
    page.title
  end
end
