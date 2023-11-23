module JwtAuthHandler
  extend ActiveSupport::Concern
  attr_reader :current_company, :auth_application, :auth_scopes

  included do
    before_action :authenticate_user_from_token!
  end

  private

  def authenticate_user_from_token!
    token = extract_token_from_header
    payload = decode_token(token)

    @current_resource = OpenStruct.new(payload['resource'])
    @resource_props   = OpenStruct.new(payload['props'])
    @auth_application = payload['iss']
    @auth_scopes      = payload['scopes']
    @token_info       = payload
  end

  def extract_token_from_header
    authorization_header = request.headers['Authorization']
    authorization_header&.split('Bearer ')&.last
  end

  def decode_token(token)
    rsa_public_key = OpenSSL::PKey::RSA.new(File.read('jwt/public.pem'))
    JWT.decode(token, rsa_public_key, true, { algorithm: 'RS512' }).first
  end
end
