module ApplicationHelper
    def is_current_user_admin?
        current_user.role == "admin"
    end

    def owned_by_current_user?(id:)
        current_user.id == id
    end
end
