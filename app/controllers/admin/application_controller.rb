# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include Administrate::Punditize
    before_action :authenticate_admin
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def authenticate_admin
      unless user_signed_in? && (current_user.admin? || current_user.owner?)
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end

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

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
