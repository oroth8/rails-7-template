# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :profile_complete?

  USER_FIELDS = %i[name email address unit city postal_code].freeze

  def profile_complete?
    check_for_empty_fields.empty?
  end

  def missing_fields
    profile_complete? ? nil : check_for_empty_fields
  end

  private

  def check_for_empty_fields
    USER_FIELDS.select { |f| __send__(f).blank? }
  end
end
