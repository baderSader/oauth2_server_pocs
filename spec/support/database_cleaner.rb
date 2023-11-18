# spec/support/database_cleaner.rb

require 'database_cleaner'

if Rails.env.test?
  RSpec.configure do |config|
    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, type: :feature) do
      # For feature tests, switch to truncation strategy
      # because some drivers don't support transactions
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each, type: :request) do
      # For request tests, switch to truncation strategy
      # because some drivers don't support transactions
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end
