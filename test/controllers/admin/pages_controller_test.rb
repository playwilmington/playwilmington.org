# frozen_string_literal: true
require "test_helper"

module Admin
  class PagesControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @page = pages(:one)
      @tab = pages(:two)
    end

    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should get create" do
      assert_difference "Page.count" do
        post :create, params: {
          page: {
            title: "Home",
            name: "page_name",
            page_type: "Tab",
            page_id: @page.id,
            icon: "home",
            order: 10,
            content: "Content"
          }
        }
      end

      assert_redirected_to admin_pages_path
    end

    test "should not get create" do
      assert_no_difference "Page.count" do
        post :create, params: {
          page: {
            title: nil,
            name: "page_name",
            page_type: "Tab",
            icon: "home",
            content: "",
            order: 10
          }
        }
      end

      assert_response :ok
    end

    test "should get update" do
      patch :update, params: {
        id: @page.id,
        page: {
          title: "Home",
          name: "page_name",
          page_type: "Page",
          icon: "home",
          order: 10,
          content: "Content"
        }
      }

      assert_redirected_to admin_pages_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @page.id,
        page: {
          title: nil,
          name: "page_name",
          page_type: "Page",
          icon: "",
          order: 10,
          content: "Content"
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Page.count", -1) do
        delete :destroy, params: { id: @page.id }
      end

      assert_redirected_to admin_pages_path
    end
  end
end
