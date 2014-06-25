json.array!(@identities) do |identity|
  json.extract! identity, :id, :uid, :service_id
  json.url identity_url(identity, format: :json)
end
