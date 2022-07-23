class UnitPolicy < ApplicationPolicy
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

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.owner?
        scope.where(organisation: user.organisation)
      elsif user.standard?
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
