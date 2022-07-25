class Event < ApplicationRecord
  belongs_to :user
  enum date_type: { daily: 1, weekly: 2, monthly: 3, annually: 4 }

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  # uniqueness: { scope: :organisation_id}
  validates :date_type, presence: true
  validate :check_date_timings, if: :start_and_end_times_present?

  private

  def start_and_end_times_present?
    start_time && end_time
  end

  def check_date_timings
    errors.add(:start_time, "can't be in the past") if start_time.past?

    errors.add(:end_time, "can't be in the past") if end_time.past?

    errors.add(:end_time, "can't be before start time") if end_time < start_time
  end
end
