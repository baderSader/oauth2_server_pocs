# app/controllers/concerns/exception_handler.rb

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWT::DecodeError, with: :handle_jwt_decode_error
    rescue_from OpenSSL::PKey::RSAError, with: :handle_rsa_error
    rescue_from Doorkeeper::Errors::DoorkeeperError, with: :handle_doorkeeper_error
  end

  private

  def handle_jwt_decode_error(exception)
    render json: { error: 'Invalid JWT token', details: exception.message }, status: :unauthorized
  end

  def handle_rsa_error(exception)
    render json: { error: 'RSA error', details: exception.message }, status: :internal_server_error
  end

  def handle_doorkeeper_error(exception)
    render json: { error: 'Doorkeeper authentication error', details: exception.description }, status: :unauthorized
  end

  def unauthorized_response
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

end
  