class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end


    def after_sign_up_path_for(resource)
      user_path(current_user)
    end

    def after_update_path_for(resource)
      user_path(current_user)
    end

end
