class CompanyPolicy < ApplicationPolicy
	attr_reader :user, :company

	def initialize(user, company)
		raise Pundit::NotAuthorizedError, "must be logged in" unless user
		@user = user
		@company = company
	end

  def show?
    user.admin? || user.role?(:admin) || user.role?(:dispatcher) || user.role?(:accountant)
	end

	def edit?
		user.admin? || user.role?(:admin)
	end

	def update?
		edit?
	end
end