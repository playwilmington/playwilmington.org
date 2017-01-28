# frozen_string_literal: true
require "test_helper"

module Admin
  class UsersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @user = users(:two)
    end

    test "should get index" do
      sign_out users(:one)
      sign_in users(:one)
      get :index
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @user.id,
        user: {
          admin: false
        }
      }

      assert_redirected_to admin_users_path
    end

    test "should get destroy" do
      assert_difference("User.count", -1) do
        delete :destroy, params: { id: @user.id }
      end

      assert_redirected_to admin_users_path
    end
  end
end
