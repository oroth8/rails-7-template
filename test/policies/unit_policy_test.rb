# frozen_string_literal: true

# rails test 'test/policies/unit_policy_test.rb'
require 'test_helper'

class UnitPolicyTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin = users(:owen)
    @owner = users(:brooks)
    @user = users(:jamie)
  end

  test 'an owner can access all unit routes belonging to org' do
    sign_in @owner

    existing_units = @owner.organisation.units
    assert_equal existing_units.count, 2

    get units_path
    assert_response :success
    assert_select 'a[href=?]', "/units/#{existing_units[0].id}", 1
    assert_select 'a[href=?]', "/units/#{existing_units[1].id}", 1

    get new_unit_path
    assert_response :success

    assert_difference('Unit.count') do
      post units_url,
           params: { unit: { name: 'New Unit', number: '2000A', organisation_id: @owner.organisation_id } }
    end
    @new_unit = Unit.find_by(number: '2000A')
    assert_redirected_to unit_url(@new_unit)

    get unit_url(@new_unit)
    assert_response :success

    patch unit_url(@new_unit),
          params: { unit: { name: 'New Unit2', number: @new_unit.number,
                            organisation_id: @new_unit.organisation_id } }
    assert_redirected_to unit_url(@new_unit)

    assert_equal @new_unit.reload.name, 'New Unit2'

    assert_difference('Unit.count', -1) do
      delete unit_url(@new_unit)
    end

    assert_redirected_to units_url
  end

  test 'a user cannot access new_unit route and delete route' do
    sign_in @user

    get new_unit_path
    assert_redirected_to root_path

    assert_no_difference('Unit.count') do
      delete unit_url(@user.unit)
    end

    assert_redirected_to root_path
  end

  test 'a user can access their own unit' do
    sign_in @user
    get unit_url(@user.unit)
    assert_response :success

    get units_path
    assert_response :success
  end
end
