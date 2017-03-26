# frozen_string_literal: true
class PhotoAlbum < ApplicationRecord
  validates :title, :order, :page_id, presence: true

  belongs_to :page
  has_many :photos

  accepts_nested_attributes_for :photos, reject_if: :all_blank,
                                                    allow_destroy: true

  def page_name
    return if page_id.blank?
    page.title
  end
end
