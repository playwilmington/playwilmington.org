require 'test_helper'

class Admin
  class DashboardControllerTest < ActionController::TestCase
    test 'should get index' do
      sign_in users(:one)
      get :index
      assert_response :success
    end

    test 'should not get index sign_in' do
      sign_in users(:two)
      get :index
      assert_response :redirect
    end
  end
end
