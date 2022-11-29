class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :skill_level])

    # Just for edit
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :skill_level])
  end

  def after_sign_out_path_for(user)
    root_path
  end

end
