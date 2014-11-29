json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :description, :title, :email
  json.url suggestion_url(suggestion, format: :json)
end
