# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :organisation
  has_many :user, dependent: :nullify
end
