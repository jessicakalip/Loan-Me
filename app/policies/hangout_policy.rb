class HangoutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    !(record.profile == user.profile)
  end

  def update?
    record.user == user || record.profile == user.profile
  end

  def destroy?
    record.user == user
  end
end
