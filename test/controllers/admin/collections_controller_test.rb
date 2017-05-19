# frozen_string_literal: true

require "test_helper"

module Admin
  class CollectionsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @collection = collections(:one)
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
      get :show, params: { id: @collection.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Collection.count" do
        post :create, params: {
          collection: {
            title: "Home",
            page_id: @page.id,
            order: 1,
            icon: "test",
            link: "Content",
            is_header: false,
            active: true
          }
        }
      end

      assert_redirected_to admin_collections_path
    end

    test "should not get create" do
      assert_no_difference "Collection.count" do
        post :create, params: {
          collection: {
            title: nil,
            page_id: @page.id,
            order: 1,
            icon: "test",
            link: "Content",
            is_header: false,
            active: true
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @collection.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @collection.id,
        collection: {
          title: "Home",
          order: 1,
          icon: "test",
          link: "Content",
          is_header: false,
          active: true
        }
      }

      assert_redirected_to admin_collections_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @collection.id,
        collection: {
          title: nil,
          order: 1,
          icon: "test",
          link: "Content",
          is_header: false,
          active: true
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Collection.count", -1) do
        delete :destroy, params: { id: @collection.id }
      end

      assert_redirected_to admin_collections_path
    end
  end
end
