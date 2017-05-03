require 'factory_girl_rails'
Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:each, type: :request) do
    host! 'example.com'
  end

  config.include FactoryGirl::Syntax::Methods
end
