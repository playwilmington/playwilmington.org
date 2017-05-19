# frozen_string_literal: true

require "test_helper"

module Docs
  class HowToUseControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    test "should get alerts" do
      sign_in users(:one)
      get :alerts
      assert_response :success
    end

    test "should get card_groups" do
      sign_in users(:one)
      get :card_groups
      assert_response :success
    end

    test "should get collapsibles" do
      sign_in users(:one)
      get :collapsibles
      assert_response :success
    end

    test "should get collections" do
      sign_in users(:one)
      get :collections
      assert_response :success
    end

    test "should get contacts" do
      sign_in users(:one)
      get :contacts
      assert_response :success
    end

    test "should get exhibits" do
      sign_in users(:one)
      get :exhibits
      assert_response :success
    end

    test "should get markers_maps" do
      sign_in users(:one)
      get :markers_maps
      assert_response :success
    end

    test "should get pages" do
      sign_in users(:one)
      get :pages
      assert_response :success
    end

    test "should get photo_albums" do
      sign_in users(:one)
      get :photo_albums
      assert_response :success
    end

    test "should get settings" do
      sign_in users(:one)
      get :settings
      assert_response :success
    end

    test "should get sliders" do
      sign_in users(:one)
      get :sliders
      assert_response :success
    end

    test "should get testimonials" do
      sign_in users(:one)
      get :testimonials
      assert_response :success
    end

    test "should get make_admin" do
      sign_in users(:one)
      get :make_admin
      assert_response :success
    end
  end
end
