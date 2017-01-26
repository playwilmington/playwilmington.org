# frozen_string_literal: true
require "test_helper"

module Admin
  class SlidersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @slider = sliders(:one)
      @file = sample_file
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
      assert_difference "Slider.count" do
        post :create, params: {
          slider: {
            title: "I am Title",
            subtitle: "I am Subtitle",
            position: "center-align",
            order: 1,
            active: true,
            photo: @file
          }
        }
      end

      assert_redirected_to admin_sliders_path
    end

    test "should not get create" do
      assert_no_difference "Slider.count" do
        post :create, params: {
          slider: {
            title: "I am Title",
            subtitle: "I am Subtitle",
            position: "center-align",
            order: 1,
            active: true
          }
        }
      end

      assert_response :ok
    end

    test "should get update" do
      patch :update, params: {
        id: @slider.id,
        slider: {
          title: "I am Title",
          subtitle: "I am Subtitle",
          position: "center-align",
          order: 1,
          active: true,
          photo: @file
        }
      }

      assert_redirected_to admin_sliders_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @slider.id,
        slider: {
          title: "I am Title",
          subtitle: "I am Subtitle",
          position: "center-align",
          order: 1,
          active: true
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Slider.count", -1) do
        delete :destroy, params: { id: @slider.id }
      end

      assert_redirected_to admin_sliders_path
    end
  end
end
