# frozen_string_literal: true

class Organisms::HeaderComponent < ViewComponent::Base
    delegate :current_user, :user_signed_in?, :new_user_session_path,
    :new_user_session_path, :new_user_registration_path, to: :helpers
end
