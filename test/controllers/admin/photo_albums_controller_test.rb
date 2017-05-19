# frozen_string_literal: true

require "test_helper"

module Admin
  class PhotoAlbumsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @photo_album = photo_albums(:one)
      @page = pages(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should get show" do
      get :show, params: { id: @photo_album.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "PhotoAlbum.count" do
        post :create, params: {
          photo_album: {
            title: "Album One",
            page_id: @page.id,
            order: 1,
            active: true
          }
        }
      end

      assert_redirected_to admin_photo_albums_path
    end

    test "should not get create" do
      assert_no_difference "PhotoAlbum.count" do
        post :create, params: {
          photo_album: {
            title: nil,
            page_id: @page.id,
            order: 1,
            active: true
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @photo_album.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @photo_album.id,
        photo_album: {
          title: "Album One",
          page_id: @page.id,
          order: 1,
          active: true
        }
      }

      assert_redirected_to admin_photo_albums_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @photo_album.id,
        photo_album: {
          title: nil,
          page_id: @page.id,
          order: 1,
          active: true
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("PhotoAlbum.count", -1) do
        delete :destroy, params: { id: @photo_album.id }
      end

      assert_redirected_to admin_photo_albums_path
    end
  end
end
