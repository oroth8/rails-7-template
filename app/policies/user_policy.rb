# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    auth_user?
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    auth_user?
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    auth_user?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      case user.role
      when 'admin'
        scope.all
      when 'owner'
        scope.where(organisation: user.organisation)
      when 'standard'
        scope.where(id: user.id)
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
