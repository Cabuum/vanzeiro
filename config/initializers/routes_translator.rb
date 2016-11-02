RouteTranslator.config do |config|
  config.generate_unlocalized_routes = true if Rails.env.test?
end
