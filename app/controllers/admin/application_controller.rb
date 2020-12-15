class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_is_admin

  rescue_from ActionController::RoutingError do |_exception|
    redirect_to root_path
  end

  private

  def check_if_user_is_admin
    redirect_to root_path unless role_can_access_admin_panel
  end

  def role_can_access_admin_panel
    current_user.admin? ||
      current_user.role?(:admin) ||
      current_user.role?(:dispatcher)
  end
end
