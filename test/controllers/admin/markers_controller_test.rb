# frozen_string_literal: true
require "test_helper"

module Admin
  class MarkersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @marker = markers(:one)
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
      get :show, params: { id: @marker.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "Marker.count" do
        post :create, params: {
          marker: {
            address: "123 Main Street",
            title: "Random",
            body: "MyText",
            marker_type: "Parking",
            page_id: @page.id
          }
        }
      end

      assert_redirected_to admin_markers_path
    end

    test "should not get create" do
      assert_no_difference "Marker.count" do
        post :create, params: {
          marker: {
            address: "123 Main Street",
            title: nil,
            body: "MyText",
            marker_type: "Parking",
            page_id: @page.id
          }
        }
      end

      assert_response :ok
    end

    test "should get update" do
      patch :update, params: {
        id: @marker.id,
        marker: {
          address: "123 Main Street",
          title: "Random",
          body: "MyText",
          marker_type: "Parking",
          page_id: @page.id
        }
      }

      assert_redirected_to admin_markers_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @marker.id,
        marker: {
          address: "123 Main Street",
          title: nil,
          body: "MyText",
          marker_type: "Parking",
          page_id: @page.id
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("Marker.count", -1) do
        delete :destroy, params: { id: @marker.id }
      end

      assert_redirected_to admin_markers_path
    end
  end
end
