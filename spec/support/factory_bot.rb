# spec/support/factory_bot.rb

require 'factory_bot_rails'
require 'faker'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
  