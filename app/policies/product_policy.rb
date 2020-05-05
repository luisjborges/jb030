class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def create?
    user.admin?
  end

  def voucher?
    true
  end

  def shirt?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def admin?
    user.admin?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
