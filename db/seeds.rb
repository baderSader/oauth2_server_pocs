# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Company.create(name: '1st company')
Company.create(name: '2nd company')
Company.create(name: '3ed company')
Company.create(name: '4th company')
company = Company.create(name: '5th company')

User.create(
  email: 'bader.bahjat@gmail.com',
  password: 123123123,
  company: company
)

Doorkeeper::Application.create!(
  name:         'Your Application Name',
  redirect_uri: 'http://localhost:3000/',
  uid:          '1111',
  secret:       '2222',
  scopes:       'public read write'
)
