# frozen_string_literal: true

# rails test 'test/policies/organisation_policy_test.rb'
require 'test_helper'

class OrganisationPolicyTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin = users(:owen)
    @owner = users(:brooks)
    @user = users(:jamie)
  end

  test 'an owner can access their orgs only' do
    sign_in @owner

    owner_org = @owner.organisation
    assert_not_nil owner_org

    get organisations_path
    assert_response :success
    assert_select 'a[href=?]', "/organisations/#{owner_org.id}", 1

    get new_organisation_path
    assert_redirected_to root_path

    assert_difference('Organisation.count') do
      post organisations_url,
           params: { organisation: { capacity: 4, name: 'Test Org' } }
    end

    @new_org = Organisation.find_by(name: 'Test Org')

    assert_redirected_to organisation_url(@new_org)

    get organisation_url(@new_org)
    assert_response :success

    patch organisation_url(@new_org),
          params: { organisation: { capacity: 6, name: 'Update Org' } }
    assert_redirected_to organisation_url(@new_org)

    assert_equal @new_org.reload.name, 'Update Org'

    assert_difference('Organisation.count', -1) do
      delete organisation_url(@new_org)
    end

    assert_redirected_to organisations_url
  end

  #   test 'a user cannot access new_unit route and delete route' do
  #     sign_in @user

  #     get new_unit_path
  #     assert_redirected_to root_path

  #     assert_no_difference('Unit.count') do
  #       delete unit_url(@user.unit)
  #     end

  #     assert_redirected_to root_path
  #   end

  #   test 'a user can access their own unit' do
  #     sign_in @user
  #     get unit_url(@user.unit)
  #     assert_response :success

  #     get units_path
  #     assert_response :success
  #   end
end
