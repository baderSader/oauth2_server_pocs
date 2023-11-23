class Company < ApplicationRecord
  has_many :user

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           as: :resource_owner,
           dependent: :

  has_many :oauth_access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           as: :resource_owner,
           dependent: :destroy

end
