class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user == user && record.hangout.status == "completed"
  end

  def destroy?
    record.user == user
  end
end
