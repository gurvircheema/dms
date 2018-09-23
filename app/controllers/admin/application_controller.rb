class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_is_admin

  rescue_from ActionController::RoutingError do |exception|
    redirect_to root_path
  end
  private

  def check_if_user_is_admin
    redirect_to root_path unless current_user.is_admin?
  end
end
