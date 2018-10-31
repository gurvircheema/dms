class UserPolicy < ApplicationPolicy
  attr_reader :user, :other_user

  def initialize(user, other_user)
    @user = user
    @other_user = other_user
  end

  def index?
    user.admin? || user.role?(:admin)
  end

  def new?
    user.admin? || user.role?(:admin)
  end

  def create?
    new?
  end

  def edit?
    user.admin? || user.role?(:admin) || user == other_user
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? || user.role?(:admin)
  end
end