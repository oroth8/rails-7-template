class Event < ApplicationRecord
  belongs_to :user
  enum date_type: { one_day_only: 0, daily: 1, weekly: 2, monthly: 3, annually: 4 }

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :name, presence: true
  validates :date_type, presence: true

  after_initialize do
    self.date_type ||= :one_day_only if new_record?
  end
end
