require 'rails_helper'

RSpec.describe 'Doorkeeper JWT Configuration', type: :request do
  let(:user) { create(:user) }
  let(:client) { create(:oauth_application) }
  let(:access_token) { create(:access_token, resource_owner_id: user.company.id, application_id: client.id) }

  describe 'JWT token generation' do
    it 'generates a JWT token with the correct payload' do
      # Create a valid access token based on your application's requirements
      valid_token = access_token.token
      decoded_token = decode_token(valid_token)

      expect(decoded_token['iss']).to eq(client.name)
      expect(decoded_token['iat']).to be_a(Numeric)
      expect(decoded_token['aud']).to eq(client.uid)
      expect(decoded_token['jti']).to be_a(String)
      expect(decoded_token['sub']).to eq(user.id)
      expect(decoded_token['scopes']).to eq(access_token.scopes.to_a)
      expect(decoded_token['company']['id']).to eq(user.company.id)
      expect(decoded_token['company']['name']).to eq(user.company.name)
      expect(decoded_token['exp']).to be_a(Numeric)
    end
  end

  def decode_token(token)
    rsa_public_key = OpenSSL::PKey::RSA.new(File.read('jwt/public.pem'))
    JWT.decode(token, rsa_public_key, true, { algorithm: 'RS512' }).first
  end
end
