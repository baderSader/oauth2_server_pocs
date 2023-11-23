class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  has_many :access_grants,
            class_name: 'Doorkeeper::AccessGrant',
            as: :resource_owner,
            dependent: :

  has_many :oauth_access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            as: :resource_owner,
            dependent: :destroy



end
