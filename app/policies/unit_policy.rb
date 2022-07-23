class UnitPolicy < ApplicationPolicy
  def update?
    user.admin?
  end
end
