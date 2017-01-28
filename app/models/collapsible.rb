# frozen_string_literal: true
class Collapsible < ApplicationRecord
  validates :name, :collapse_style, :usage_type, :order, presence: true

  belongs_to :page
  has_many :collapsible_items, inverse_of: :collapsible

  accepts_nested_attributes_for :collapsible_items, reject_if: :all_blank,
                                                    allow_destroy: true

  scope :usage_filtered, lambda { |usage|
    where("usage_type = ? AND active = ?", usage, true).order(:order)
  }

  scope :is_active, -> { where(active: true).order(:order) }
end
