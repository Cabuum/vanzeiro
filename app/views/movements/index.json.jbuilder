json.array!(@movements) do |movement|
  json.description movement.category.name
  json.value movement.value
end
