# frozen_string_literal: true

require "test_helper"

module Admin
  class ContactEmailsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @contact_email = contact_emails(:one)
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
      get :show, params: { id: @contact_email.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "ContactEmail.count" do
        post :create, params: {
          contact_email: {
            page_id: @page.id,
            title: "Information",
            email_address: "info@playwilmington.org",
            order: 1,
            active: true
          }
        }
      end

      assert_redirected_to admin_contact_emails_path
    end

    test "should not get create" do
      assert_no_difference "ContactEmail.count" do
        post :create, params: {
          contact_email: {
            page_id: @page.id,
            title: nil,
            email_address: "info@playwilmington.org",
            order: 1,
            active: true
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @contact_email.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @contact_email.id,
        contact_email: {
          page_id: @page.id,
          title: "Information",
          email_address: "info@playwilmington.org",
          order: 1,
          active: true
        }
      }

      assert_redirected_to admin_contact_emails_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @contact_email.id,
        contact_email: {
          page_id: @page.id,
          title: nil,
          email_address: "info@playwilmington.org",
          order: 1,
          active: true
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("ContactEmail.count", -1) do
        delete :destroy, params: { id: @contact_email.id }
      end

      assert_redirected_to admin_contact_emails_path
    end
  end
end
