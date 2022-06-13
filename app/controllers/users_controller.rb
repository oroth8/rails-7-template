# frozen_string_literal: true

class UsersController < ApplicationController
  def index
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to dashboard_path, notice: "User updated" }
      else
        format.html do
          render :index,
                 status: :unprocessable_entity,
                 notice: "Please fill out all fields"
        end
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
