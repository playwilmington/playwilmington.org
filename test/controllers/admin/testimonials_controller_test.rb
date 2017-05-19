# frozen_string_literal: true

require "test_helper"

module Admin
  class TestimonialsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @testimonial = testimonials(:one)
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
      get :show, params: { id: @testimonial.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Testimonial.count" do
        post :create, params: {
          testimonial: {
            name: "Unknown",
            quote: "Test"
          }
        }
      end

      assert_redirected_to admin_testimonials_path
    end

    test "should not get create" do
      assert_no_difference "Testimonial.count" do
        post :create, params: {
          testimonial: {
            name: "Unknown",
            quote: nil
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @testimonial.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @testimonial.id,
        testimonial: {
          name: "Unknown",
          quote: "Test"
        }
      }

      assert_redirected_to admin_testimonials_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @testimonial.id,
        testimonial: {
          name: "Unknown",
          quote: nil
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Testimonial.count", -1) do
        delete :destroy, params: { id: @testimonial.id }
      end

      assert_redirected_to admin_testimonials_path
    end
  end
end
