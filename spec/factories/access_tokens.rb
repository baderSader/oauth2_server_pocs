# spec/factories/access_tokens.rb

FactoryBot.define do
    factory :access_token, class: 'Doorkeeper::AccessToken' do
      association :application, factory: :oauth_application
      resource_owner_id { create(:company).id }
      scopes { 'read write' }
      expires_in { Doorkeeper.configuration.access_token_expires_in }
  
      trait :expired do
        expires_in { -1 }
      end
    end
  end
  