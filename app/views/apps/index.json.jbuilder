json.array!(@apps) do |app|
  json.extract! app, :id, :name, :service_id
  json.url app_url(app, format: :json)
end
