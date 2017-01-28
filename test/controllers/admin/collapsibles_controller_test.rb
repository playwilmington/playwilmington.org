# frozen_string_literal: true
require "test_helper"

module Admin
  class CollapsiblesControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @collapsible = collapsibles(:one)
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
      get :show, params: { id: @collapsible.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Collapsible.count" do
        post :create, params: {
          collapsible: {
            name: "Test Name",
            active: true,
            is_popout: false,
            collapse_style: "accordion",
            usage_type: "Home-Page",
            order: 1,
            collapsible_item: {
              title: "Test Title",
              body: "Test Body",
              active: true,
              icon: nil
            }
          }
        }
      end

      assert_redirected_to admin_collapsibles_path
    end

    test "should not get create" do
      assert_no_difference "Collapsible.count" do
        post :create, params: {
          collapsible: {
            name: nil,
            active: true,
            is_popout: false,
            collapse_style: "accordion",
            usage_type: "Home-Page",
            order: 1,
            collapsible_item: {
              title: "Test Title",
              body: "Test Body",
              active: true,
              icon: nil
            }
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @collapsible.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @collapsible.id,
        collapsible: {
          name: "Test Name",
          active: true,
          is_popout: false,
          collapse_style: "accordion",
          usage_type: "Home-Page",
          order: 1
        }
      }

      assert_redirected_to admin_collapsibles_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @collapsible.id,
        collapsible: {
          name: nil,
          active: true,
          is_popout: false,
          collapse_style: "accordion",
          usage_type: "Home-Page",
          order: 1
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Collapsible.count", -1) do
        delete :destroy, params: { id: @collapsible.id }
      end

      assert_redirected_to admin_collapsibles_path
    end
  end
end
