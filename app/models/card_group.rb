# frozen_string_literal: true
class CardGroup < ApplicationRecord
  validates :page_id, :grid, :order, presence: true

  belongs_to :page
  has_many :cards, inverse_of: :card_group

  accepts_nested_attributes_for :cards, reject_if: :all_blank,
                                        allow_destroy: true

  scope :is_active, -> { where(active: true).order(:order) }

  def page_name
    return if page_id.blank?
    page.title
  end
end
