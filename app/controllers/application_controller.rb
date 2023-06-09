class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :configure_sign_up_params, only: [:create], if: -> { devise_controller? }
    before_action :turbo_frame_request_variant, if: -> { turbo_frame_request? }

    private

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :phone_no])
    end

    def is_admin?
        current_user&.role == :admin
    end

    def turbo_frame_request_variant
        request.variant = :turbo_frame
    end
end
