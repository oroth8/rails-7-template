# frozen_string_literal: true

json.extract! unit, :id, :name, :number, :organisation_id, :created_at, :updated_at
json.url unit_url(unit, format: :json)
