FactoryBot.define do
    factory :oauth_application, class: 'Doorkeeper::Application' do
      name { Faker::App.name }
      uid { SecureRandom.uuid }
      secret { SecureRandom.hex(16) }
      redirect_uri { Faker::Internet.url }
    end
end
 