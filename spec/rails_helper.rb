ENV['RAILS_ENV'] ||= 'test'

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'simplecov'

SimpleCov.configure do
  coverage_dir File.join('.', 'tmp', 'code_analysis', 'coverage')
  minimum_coverage 2.8
end

SimpleCov.start 'rails' do
  add_filter '/lib/'
end

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'factory_girl'
require 'forgery'
require 'shoulda/matchers'
require 'database_cleaner'

ActiveRecord::Migration.maintain_test_schema!

require 'support/forgery_frozen_kinds'

abort('----- PRODUCTION BROW ------') if Rails.env.production?

Dir[File.join("#{Rails.root}/spec/support/**/*.rb")].each { |f| require f }

FactoryGirl.definition_file_paths = %w(spec/support/factories)
FactoryGirl.reload

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
  end
end

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  config.before(:each, type: :controller) do
    @current_user = FactoryGirl.create(:user)

    login_as @current_user
  end

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
end
