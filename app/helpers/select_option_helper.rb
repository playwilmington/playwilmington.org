# frozen_string_literal: true

module SelectOptionHelper
  def options_page_type(value)
    options_for_select(%w[Page Tab], value)
  end

  def options_positions(value)
    options_for_select(%w[center-align right-align left-align], value)
  end

  def options_col_styles(value)
    options_for_select(%w[accordion expandable], value)
  end

  def options_available_pages(value)
    options_from_collection_for_select(Page.available_pages, :id, :title, value)
  end

  def options_usage_types(value)
    options_for_select(%w[Home-Page Page/Tab], value)
  end

  def options_pages(value)
    options_from_collection_for_select(Page.pages_tabs, :id, :title, value)
  end

  def options_marker_types(value)
    options_for_select(%w[Museum Parking Food], value)
  end

  def options_grid(value)
    options_for_select(grids, value)
  end

  def options_size(value)
    options_for_select(%w[none small medium large], value)
  end

  private

  def grids
    [["s12 m12 l12"], ["s12 m6 l4"], ["s12 m6"], ["s12 m4"]]
  end
end
