# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'can create and save user with minimum fields' do
    user = User.new(email: 'example@google.com', password: '123test!')
    assert user
    assert user.valid?

    assert_difference -> { User.count }, 1 do
      user.save!
    end
  end

  test 'cannot save users without email' do
    user = User.new(name: 'Owen Roth', password: '123test!')
    assert_not user.valid?

    assert_raise StandardError do
      user.save!
    end
  end

  test 'create user, update with remaining fields correctly' do
    user = User.new(email: 'example@google.com', password: '123test!')
    assert user.save!

    name = 'Owen Roth'
    address = '145 Home'
    postal_code = '123456'
    city = 'ktown'
    unit = '2z'

    assert user.update!(name: name, address: address, postal_code: postal_code, city: city, unit: unit)
    assert user.profile_complete?
    assert_equal user.name, name
    assert_equal user.address, address
    assert_equal user.postal_code, postal_code
    assert_equal user.city, city
    assert_equal user.unit, unit
  end
end
