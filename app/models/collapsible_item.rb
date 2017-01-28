# frozen_string_literal: true
class CollapsibleItem < ApplicationRecord
  validates :title, :order, :body, presence: true
  belongs_to :collapsible

  scope :is_active, -> { where(active: true).order(:order) }
end
