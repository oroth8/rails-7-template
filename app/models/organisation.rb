# frozen_string_literal: true

class Organisation < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :units, dependent: :destroy
end
