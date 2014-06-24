json.array!(@services) do |service|
  json.extract! service, :id, :name, :logo_url, :is_dynamic
  json.url service_url(service, format: :json)
end
