# frozen_string_literal: true

require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "should be true for viewable" do
    @controller = Devise::SessionsController.new
    assert_equal true, viewable?
  end
end
