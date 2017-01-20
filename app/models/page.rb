class Page < ApplicationRecord
  validates :title, :page_type, presence: true
  validates :name, uniqueness: true
  validate :tab_content_check, :tab_page_check, :page_check
  validates_inclusion_of :page_type,
                         in: %w(Page Tab),
                         message: 'Page Type %{value} is not an option'
  validates_format_of :name, with: /\A([a-z_]*)\z/i, message: '%{value} can
                             only contain lowercase letters and underscores'

  belongs_to :page, class_name: 'Page'
  has_many :pages, class_name: 'Page', foreign_key: :page_id

  after_save :reload_routes

  scope :main, -> { where('page_type = ? AND active = ?', 'Page', true) }
  scope :pages_only, -> { where(page_type: 'Page') }
  scope :tabs, -> { where(active: true) }

  def reload_routes
    DynamicRouter.reload
  end

  def route
    name + '_path'
  end

  def tab_content_check
    return unless page_type == 'Tab' && (content.nil? || content == '')
    errors.add(:content, 'Content is Required for Tabs')
  end

  def tab_page_check
    return unless page_type == 'Tab' && page_id.nil?
    errors.add(:page_id, 'Parent Page Requried when page type is Tab')
  end

  def page_check
    return unless page_type == 'Page' && (icon.nil? || icon == '')
    errors.add(:icon, 'Icon Required when page type is Page')
  end
end
