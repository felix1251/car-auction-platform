class ApplicationController < ActionController::Base
    before_action :configure_sign_up_params, only: [:create]

    private

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :phone_no]) if devise_controller?
    end

    def is_admin?
        current_user&.role == :admin
    end
end
