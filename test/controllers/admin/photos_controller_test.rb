# frozen_string_literal: true

require "test_helper"

module Admin
  class PhotosControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @photo_album = photo_albums(:one)
    end

    test "should get new" do
      get :new, params: { photo_album_id: @photo_album.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Photo.count" do
        post :create, params: {
          photo_album_id: @photo_album.id,
          photo: {
            image: fixture_file_upload("files/test_image.jpg", "image/jpg")
          }
        }
      end

      assert_redirected_to admin_photo_albums_path
    end

    test "should not get create" do
      assert_no_difference "Photo.count" do
        post :create, params: {
          photo_album_id: @photo_album.id,
          photo: {
            image: nil
          }
        }
      end

      assert_response :ok
    end
  end
end
