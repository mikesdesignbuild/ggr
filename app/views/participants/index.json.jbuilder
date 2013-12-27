json.array!(@participants) do |participant|
  json.extract! participant, :id, :user, :event, :captain, :coxswain, :participated, :late
  json.url participant_url(participant, format: :json)
end
