# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
    # Add other global configurations here
  end
  
  RSpec.configure do |config|
    config.include Warden::Test::Helpers, type: :feature
    config.after(type: :feature) { Warden.test_reset! }
  end
  


  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!


  config.filter_rails_from_backtrace!

end
