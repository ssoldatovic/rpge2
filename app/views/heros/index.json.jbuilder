json.array!(@heros) do |hero|
  json.extract! hero, :id, :name, :picture, :user_id
  json.url hero_url(hero, format: :json)
end
