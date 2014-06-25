json.array!(@users) do |user|
  json.extract! user, :id, :service_id, :external_id, :username, :avatar_url
  json.url user_url(user, format: :json)
end
