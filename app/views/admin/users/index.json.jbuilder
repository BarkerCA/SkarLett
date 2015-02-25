json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :email, :enabled, :password_hash, :password_salt
  json.url user_url(user, format: :json)
end
