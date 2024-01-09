class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :configure_sign_up_params, only: [:create], if: -> { devise_controller? }
    skip_before_action :verify_authenticity_token

    private

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :phone_no])
    end

    def is_admin?
        current_user.role == :admin
    end
end
