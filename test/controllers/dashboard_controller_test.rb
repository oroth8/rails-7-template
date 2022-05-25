# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'should redirect to login if NOT logged in' do
    get dashboard_path
    assert_redirected_to new_user_session_path
  end

  test 'should render dashboard if user logged in' do
    sign_in users(:brooks)
    get dashboard_path
    assert_response :success
  end
end
