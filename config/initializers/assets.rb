# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.precompile += %w( bootstrap/glyphicons-halflings-regular.eot )
# Rails.application.config.assets.precompile += %w( bootstrap/glyphicons-halflings-regular.woff )
# Rails.application.config.assets.precompile += %w( bootstrap/glyphicons-halflings-regular.svg )
# Rails.application.config.assets.precompile += %w( bootstrap/glyphicons-halflings-regular.ttf )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( frontend.js login-page.js backend.js
frontend.css login-page.css backend.css )
