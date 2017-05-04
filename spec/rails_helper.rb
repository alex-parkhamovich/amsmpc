ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara-webkit'

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 5

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include ApplicationHelper
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include Warden::Test::Helpers, type: :request
end
