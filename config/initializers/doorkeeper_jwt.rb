# config/initializers/doorkeeper_jwt.rb

Doorkeeper::JWT.configure do

    token_payload do |opts|
      company   = Company.find(opts[:resource_owner_id])
      app_name  = opts[:application].name
      scopes    = opts[:scopes].to_a

      expire_time = Doorkeeper.configuration.access_token_expires_in
      expire_at   = Time.current.utc + expire_time
    
      token = {
        iss: app_name,
        iat: Time.current.utc.to_i,
        aud: opts[:application][:uid],
  
        jti: SecureRandom.uuid,
        sub: company.id,
        scopes: scopes,
  
        company: {
          id: company.id,
          name: company.name
        },

        exp: expire_at.to_i
      }
    end
  
    secret_key_path 'jwt/private.pem'
    encryption_method :RS512

  end