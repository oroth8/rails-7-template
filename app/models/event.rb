# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  enum date_type: { daily: 0, weekly: 1, monthly: 2, annually: 3 }

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  # uniqueness: { scope: :organisation_id}
  validate :check_date_timings, if: :start_and_end_times_present?

  # before_save :set_repeating

  private

  # def set_repeating
  #   self.date_type = nil unless repeating
  # end

  def start_and_end_times_present?
    start_time && end_time
  end

  def check_date_timings
    errors.add(:start_time, "can't be in the past") if start_time.past?

    errors.add(:end_time, "can't be in the past") if end_time.past?

    errors.add(:end_time, "can't be before start time") if end_time < start_time
  end
end
