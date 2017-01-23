require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test 'define parent page' do
    @page = pages(:one)
    @tab = pages(:two)
    @tab.page_id = @page.id
    @tab.save
    @tab.parent_page
  end
end
