# frozen_string_literal: true

require "test_helper"

module Admin
  class AlertsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @alert = alerts(:one)
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
      get :show, params: { id: @alert.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Alert.count" do
        post :create, params: {
          alert: {
            title: "Home",
            name: "page_name",
            start_date: "2017-01-21",
            end_date: "2017-01-21",
            content: "Content"
          }
        }
      end

      assert_redirected_to admin_alerts_path
    end

    test "should not get create" do
      assert_no_difference "Alert.count" do
        post :create, params: {
          alert: {
            title: nil,
            name: "page_name",
            start_date: "2017-01-21",
            end_date: "2017-01-21",
            content: "Content"
          }
        }
      end

      assert_response :ok
    end

    test "should get error on start date" do
      assert_no_difference "Alert.count" do
        post :create, params: {
          alert: {
            title: "Alert Test",
            name: "page_name",
            start_date: "2017-01-23",
            end_date: "2017-01-21",
            content: "Content"
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @alert.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @alert.id,
        alert: {
          title: "Home",
          name: "page_name",
          start_date: "2017-01-21",
          end_date: "2017-01-21",
          content: "Content"
        }
      }

      assert_redirected_to admin_alerts_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @alert.id,
        alert: {
          title: nil,
          name: "page_name",
          start_date: "2017-01-21",
          end_date: "2017-01-21",
          content: "Content"
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Alert.count", -1) do
        delete :destroy, params: { id: @alert.id }
      end

      assert_redirected_to admin_alerts_path
    end
  end
end
