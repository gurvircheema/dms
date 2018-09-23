class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!

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
