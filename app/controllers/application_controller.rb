class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  case resource
  when Admin
    admins_path
  when User
    root_path
  end
end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :postal_code, :address])
  end
end
