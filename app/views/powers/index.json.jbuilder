json.array!(@powers) do |power|
  json.extract! power, :id, :name, :value, :picture, :user_id, :hero_id
  json.url power_url(power, format: :json)
end
