class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def admin?
    user.admin?
  end

  def create?
    true
  end

  def show?
    true
  end

end
