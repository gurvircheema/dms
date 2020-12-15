class LocationPolicy < ApplicationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user = user
    @location = location
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
