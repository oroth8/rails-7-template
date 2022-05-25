# frozen_string_literal: true

# Root page controller
class LandingPageController < ApplicationController
  def index
    redirect_to dashboard_path if user_signed_in?
  end
end
