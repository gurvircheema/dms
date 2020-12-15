class VendorPolicy < ApplicationPolicy
  attr_reader :user, :vendor

  def initialize(user, vendor)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @vendor = vendor
  end

  def index?
    user.admin? || user.role?(:admin) || user.role?(:dispatcher)
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end
end
