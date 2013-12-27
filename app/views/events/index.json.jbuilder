json.array!(@events) do |event|
  json.extract! event, :id, :on_date, :at_time, :boat
  json.url event_url(event, format: :json)
end
