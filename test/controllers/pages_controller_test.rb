# frozen_string_literal: true
require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should get show" do
    get "/#{@page.name}"
    assert_response :success
  end
end
