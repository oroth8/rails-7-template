# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'user can be updated via params' do
    user = users(:basic_user)
    sign_in user
    get dashboard_path
    assert_response :success
    put user_path(user),
        params: {
          user: {
            name: 'Owen Roth',
            address: '145 Home',
            postal_code: '123456',
            unit: '12v',
            city: 'ktown'
          },
          id: user.id
        }
    assert_redirected_to dashboard_path

    assert user.reload.profile_complete?
  end
end
