# frozen_string_literal: true

require "test_helper"

module Admin
  class ExhibitsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @exhibit = exhibits(:one)
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
      get :show, params: { id: @exhibit.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Exhibit.count" do
        post :create, params: {
          exhibit: {
            title: "Pirate Ship",
            icon: "icon",
            description: "MyString",
            page_id: @page.id,
            order: 1,
            active: true
          }
        }
      end

      assert_redirected_to admin_exhibits_path
    end

    test "should not get create" do
      assert_no_difference "Exhibit.count" do
        post :create, params: {
          exhibit: {
            title: "Pirate Ship",
            icon: "icon",
            description: "MyString",
            order: 1,
            active: true
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @exhibit.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @exhibit.id,
        exhibit: {
          title: "Pirate Ship",
          icon: "icon",
          description: "MyString"
        }
      }

      assert_redirected_to admin_exhibits_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @exhibit.id,
        exhibit: {
          title: "Pirate Ship",
          icon: nil,
          description: "MyString"
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Exhibit.count", -1) do
        delete :destroy, params: { id: @exhibit.id }
      end

      assert_redirected_to admin_exhibits_path
    end
  end
end
