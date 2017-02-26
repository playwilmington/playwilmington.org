# frozen_string_literal: true
class PhotoAlbum < ApplicationRecord
  validates :title, :order, :page_id, presence: true
  belongs_to :page
  has_many :photos

  def page_name
    return if page_id.blank?
    page.title
  end
end
