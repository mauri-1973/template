json.extract! member, :id, :name, :email, :phone, :role, :encrypted_password, :created_at, :updated_at
json.url member_url(member, format: :json)
