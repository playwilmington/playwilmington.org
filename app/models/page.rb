# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, :page_type, presence: true
  validates :name, uniqueness: true
  validate :tab_page_check, :page_check
  validates_inclusion_of :page_type,
                         in: %w[Page Tab],
                         message: "Page Type %{value} is not an option"
  validates_format_of :name, with: /\A([a-z_]*)\z/i, message: '%{value} can
                             only contain lowercase letters and underscores'

  has_many :pages, foreign_key: :page_id
  has_many :collapsibles
  has_many :collections
  has_many :markers
  has_many :card_groups
  has_many :contact_emails
  has_many :photo_albums
  has_many :exhibits

  scope :active, -> { where(active: true).order(:order) }
  scope :available_pages, -> { where(page_type: "Page").order(:order) }
  scope :pages_tabs, -> { order(:order) }
  scope :main, lambda {
    where("page_type = ? AND active = ?", "Page", true).order(:order)
  }
  scope :dashboard, -> { where(active: false) }

  def parent_page
    return unless page_id
    Page.find(page_id).title
  end

  def tab_page_check
    return unless page_type == "Tab" && page_id.nil?
    errors.add(:page_id, "Parent Page Requried when page type is Tab")
  end

  def page_check
    return unless page_type == "Page" && icon.blank?
    errors.add(:icon, "Icon Required when page type is Page")
  end
end
