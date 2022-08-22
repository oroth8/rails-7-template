# frozen_string_literal: true

class UnitPolicy < ApplicationPolicy
  def index?
    auth_user?
  end

  def new?
    auth_user?
  end

  def show?
    auth_user? || user.standard?
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

  class Scope
    def resolve
      case user.role
      when 'admin'
        scope.all
      when 'owner'
        scope.where(organisation: user.organisation)
      when 'standard'
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
