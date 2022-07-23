# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    if exception.policy.nil?
      flash[:alert] = exception.message
    else
      policy_name = exception.policy.class.to_s.underscore

      flash[:alert] = "Not Authorized: Cannot #{exception.query} #{policy_name}"
    end
    redirect_back fallback_location: root_path
  end
end
