# spec/support/factory_bot.rb

require 'factory_bot_rails'
require 'faker'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.reload
  end
end
