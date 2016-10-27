# frozen_string_literal: true
json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :price, :description, :full_description, :clause, :selected
  json.url plan_url(plan, format: :json)
end
