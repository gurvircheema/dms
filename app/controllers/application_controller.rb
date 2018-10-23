class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    flash.notice = 'No page found at that address'
    redirect_to root_path
  end

  private

  def after_sign_in_path_for(user)
    root_path
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
