class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.geocoded
    end
  end

  def show?
    true
  end

  def create?
    !(user.profile && user.profile.persisted?)
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
