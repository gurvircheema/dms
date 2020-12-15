module RolesHelper
  def assign_role!(user, role)
    UserRole.where(user: user).delete_all
    UserRole.create(user: user, role: role)
  end
end

RSpec.configure do |c|
  c.include RolesHelper
end
