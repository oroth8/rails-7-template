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

    assert user.update!(
      name: 'Owen Roth',
      address: '145 Home',
      postal_code: '123456',
      city: 'ktown',
      unit: '2z'
    )
    assert user.profile_complete?
    assert_equal user.name, 'Owen Roth'
    assert_equal user.address, '145 Home'
    assert_equal user.postal_code, '123456'
    assert_equal user.city, 'ktown'
    assert_equal user.unit, '2z'
  end

  test 'User missing_fields populate correctly' do
    user =
      User.create!(
        email: 'example@google.com',
        password: '123test!',
        name: 'Mike Thomas'
      )
    assert_equal user, User.find_by(name: 'Mike Thomas')

    missing_fields = %i[address unit city postal_code]
    assert_equal missing_fields, user.missing_fields

    assert_not user.profile_complete?

    user.update!(
      address: '123 Chicago Ave',
      unit: '1A',
      city: 'Chicago',
      postal_code: '60601'
    )
    assert_nil user.missing_fields
    assert user.profile_complete?
  end
end
