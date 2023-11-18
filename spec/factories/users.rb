# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # You might want to use a more secure password
      company
    end
  end
  