json.array!(@event_types) do |event_type|
  json.extract! event_type, :id, :name, :long_name, :description, :category_id
  json.url event_type_url(event_type, format: :json)
end