# frozen_string_literal: true

class Alert < ApplicationRecord
  validates :title, :name, :start_date, :end_date, presence: true
  validates :name, uniqueness: true
  validate :start_date_before_end_date
  validates_format_of :name, with: /\A([a-z_]*)\z/i, message: '%{value} can
                             only contain lowercase letters and underscores'
  scope :active_alerts, lambda {
    where(
      'active = :status AND start_date >= :todays_date AND end_date <=
      :todays_date', status: true, todays_date: Date.today
    )
  }

  def start_date_before_end_date
    return if end_date.nil? && start_date.nil?
    return unless end_date < start_date
    errors.add(:start_date, "- Start can not be greater than End Date")
  end

  def strd_start
    start_date.to_formatted_s(:standard)
  end

  def strd_end
    end_date.to_formatted_s(:standard)
  end
end
