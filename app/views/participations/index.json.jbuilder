json.array!(@participations) do |participation|
  json.extract! participation, :id, :user, :event, :captain, :coxswain, :missed, :late
  json.url participation_url(participation, format: :json)
end
