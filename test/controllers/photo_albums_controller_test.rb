# frozen_string_literal: true

require "test_helper"

class PhotoAlbumsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @album = photo_albums(:one)
  end

  test "should get show" do
    get :show, params: { id: @album.id }
    assert_response :success
  end
end
