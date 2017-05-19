# frozen_string_literal: true

require "test_helper"

module Admin
  class SettingsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @setting = settings(:one)
    end

    test "should get show" do
      get :show, params: { id: @setting.id }
      assert_response :success
    end

    test "should get edit" do
      get :edit, params: { id: @setting.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @setting.id,
        setting: {
          address: "Address",
          company_name: "Name",
          copyright: "CopyRight",
          email: "Email",
          phone: "1234567890",
          facebook_handle: "test",
          twitter_handle: "test",
          pinterest_handle: "test",
          instagram_handle: "test"
        }
      }

      assert_redirected_to admin_setting_path(@setting)
    end

    test "should not get update" do
      patch :update, params: {
        id: @setting.id,
        setting: {
          address: "Address",
          company_name: nil,
          copyright: "CopyRight",
          email: "Email",
          phone: "1234567890",
          facebook_handle: "test",
          twitter_handle: "test",
          pinterest_handle: "test",
          instagram_handle: "test"
        }
      }

      assert_response :ok
    end
  end
end
