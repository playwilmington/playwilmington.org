require 'test_helper'

module Admin
  class PagesControllerTest < ActionController::TestCase
    setup do
      sign_in users(:one)
    end

    test 'should get index' do
      get :index
      assert_response :success
    end

    test 'should get new' do
      get :new
      assert_response :success
    end

    test 'should get create' do
      assert_difference 'Page.count' do
        post :create, params: {
          page: {
            title: 'Home',
            icon: 'home',
            page_type: 'Page',
            content: 'Content',
            name: 'page_name'
          }
        }
      end

      assert_redirected_to admin_pages_path
    end

    test 'should not get create' do
      assert_no_difference 'Page.count' do
        post :create, params: {
          page: {
            title: nil,
            icon: 'home',
            page_type: 'Page',
            content: 'Content',
            name: 'page_name'
          }
        }
      end

      assert_response :ok
    end
  end
end
