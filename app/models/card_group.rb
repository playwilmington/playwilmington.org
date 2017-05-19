# frozen_string_literal: true

class CardGroup < ApplicationRecord
  validates :grid, :order, :usage_type, presence: true

  belongs_to :page
  has_many :cards, inverse_of: :card_group

  accepts_nested_attributes_for :cards, reject_if: :all_blank,
                                        allow_destroy: true

  scope :home_active, lambda {
    where("active = ? AND usage_type = ?", true, "Home Page").order(:order)
  }
  scope :page_active, lambda {
    where("active = ? AND usage_type = ?", true, "Page/Tab").order(:order)
  }

  def page_name
    return if page_id.blank?
    page.title
  end
end
