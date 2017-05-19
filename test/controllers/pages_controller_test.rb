# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should get show" do
    get "/#{@page.name}"
    assert_response :success
  end

  test "should post Create Message" do
    post create_message_path, params: {
      message: {
        name: "Test Name",
        email: "no-reply@playwilmington.org",
        email_to: "test@playwilmington.org",
        message: "Test Message"
      }
    }
  end

  test "should not post Create Message" do
    post create_message_path, params: {
      message: {
        name: nil,
        email: "no-reply@playwilmington.org",
        email_to: "test@playwilmington.org",
        message: "Test Message"
      }
    }
  end
end
