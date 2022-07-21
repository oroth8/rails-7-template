# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to dashboard_path, notice: 'Profile Updated' }
      else
        format.html { redirect_to dashboard_path, alert: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def required_params
    %i[name address city unit postal_code]
  end

  def user_params
    params.require(:user).permit(required_params)
  end
end
