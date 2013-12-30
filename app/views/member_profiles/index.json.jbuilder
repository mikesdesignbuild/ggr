json.array!(@member_profiles) do |member_profile|
  json.extract! member_profile, :id, :name
  json.url member_profile_url(member_profile, format: :json)
end
