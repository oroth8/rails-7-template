# frozen_string_literal: true

json.extract! event, :id, :name, :start_time, :end_time, :date_type, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
