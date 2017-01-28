# frozen_string_literal: true
require "test_helper"

module Admin
  class CardGroupsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
      sign_in users(:one)
      @card_group = card_groups(:one)
      @page = pages(:one)
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

    test "should get show" do
      get :show, params: { id: @card_group.id }
      assert_response :success
    end

    test "should get create" do
      assert_difference "CardGroup.count" do
        post :create, params: {
          card_group: {
            page_id: @page.id, grid: "s12 m12 l12", active: true, order: 1,
            card: {
              title: "Title", card_content: "Data", card_reveal: "Data",
              card_image: @file, order: 1, active: true, size: "medium",
              sticky_links: true, btn_one_name: "Button Name",
              btn_one_url: "www.google.com"
            }
          }
        }
      end

      assert_redirected_to admin_card_groups_path
    end

    test "should not get create" do
      assert_no_difference "CardGroup.count" do
        post :create, params: {
          card_group: {
            page_id: nil, grid: "s12 m12 l12", active: true, order: 1,
            card: {
              title: "Title", card_content: "Data", card_reveal: "Data",
              order: 1, active: true, size: "medium", sticky_links: true,
              btn_one_name: "Button Name", btn_one_url: "www.google.com"
            }
          }
        }
      end

      assert_response :ok
    end

    test "should get edit" do
      get :edit, params: { id: @card_group.id }
      assert_response :success
    end

    test "should get update" do
      patch :update, params: {
        id: @card_group.id,
        card_group: {
          page_id: @page.id, grid: "s12 m12 l12", active: true, order: 1,
          card: {
            title: "Title", card_content: "Data", card_reveal: "Data",
            order: 1, card_image: @file, active: true, size: "medium",
            sticky_links: true, btn_one_name: "Button Name",
            btn_one_url: "www.google.com"
          }
        }
      }

      assert_redirected_to admin_card_groups_path
    end

    test "should not get update" do
      patch :update, params: {
        id: @card_group.id,
        card_group: {
          page_id: nil, grid: "s12 m12 l12", active: true, order: nil,
          card: {
            title: "Title", card_content: "Data", card_reveal: "Data", order: 1,
            active: true, size: "medium", sticky_links: true,
            btn_one_name: "Button Name", btn_one_url: "www.google.com"
          }
        }
      }

      assert_response :ok
    end

    test "should get destroy" do
      assert_difference("CardGroup.count", -1) do
        delete :destroy, params: { id: @card_group.id }
      end

      assert_redirected_to admin_card_groups_path
    end
  end
end
