json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :pw, :email, :nickname, :description
  json.url user_url(user, format: :json)
end
