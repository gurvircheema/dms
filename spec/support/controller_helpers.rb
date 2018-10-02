module ControllerHelpers
  def sign_in_admin_user
    user = FactoryBot.create(:user, is_admin: true)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers
end