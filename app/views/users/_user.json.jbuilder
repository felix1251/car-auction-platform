json.extract! user, :id, :full_name, :email_address, :phone_no, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
