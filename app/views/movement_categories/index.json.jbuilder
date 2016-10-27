json.array!(@movement_categories) do |movement_category|
  json.extract! movement_category, :id, :name
  json.url movement_category_url(movement_category, format: :json)
end
