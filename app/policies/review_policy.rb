class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Don't delete this method!
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

end
