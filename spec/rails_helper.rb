# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'faker'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Uncomment the line below to automatically require all files in the support directory
# Rails.root.glob('spec/support/**/*.rb').sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # JSON Helper
  config.include(Module.new do
    def json
      JSON.parse(response.body)
    end
  end, type: :request)

  # JWT Token Helper
  config.include(Module.new do
    def auth_token_for_user(user)
      payload = { user_id: user.id }
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end
  end, type: :request)
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
