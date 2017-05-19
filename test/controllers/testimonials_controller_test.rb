# frozen_string_literal: true

require "test_helper"

class TestimonialsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    assert_difference "Testimonial.count" do
      post :create, params: {
        testimonial: {
          name: "Unknown",
          quote: "Test Quote"
        }
      }
    end

    assert_redirected_to root_path
  end

  test "should get not create" do
    assert_no_difference "Testimonial.count" do
      post :create, params: {
        testimonial: {
          name: "Unknown",
          quote: nil
        }
      }
    end
  end
end
