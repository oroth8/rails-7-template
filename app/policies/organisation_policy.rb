# frozen_string_literal: true

class OrganisationPolicy < ApplicationPolicy
  def index?
    admin
  end

  def new?
    admin
  end

  def show?
    auth_user?
  end

  def update?
    auth_user?
  end

  def edit?
    auth_user?
  end

  def destroy?
    auth_user?
  end

  class Scope < Scope
    def resolve
      case user.role
      when 'admin'
        scope.all
      when 'owner'
        scope.where(users: user)
      else
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end
  end

  private

  def auth_user?
    admin || owner
  end
end
