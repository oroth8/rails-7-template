# frozen_string_literal: true

# /app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Time.zone.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
