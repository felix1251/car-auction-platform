class User < ApplicationRecord
    has_one_attached :profile_img
    enum :role, { user: "USER", admin: "ADMIN" }
end
