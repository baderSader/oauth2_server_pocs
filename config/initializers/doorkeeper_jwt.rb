# config/initializers/doorkeeper_jwt.rb

Doorkeeper::JWT.configure do

    token_payload do |opts|
      resource = opts[:resource_owner]
      app_name = opts[:application].name
      scopes   = opts[:scopes].to_a

      expire_time = Doorkeeper.configuration.access_token_expires_in
      expire_at   = Time.current.utc + expire_time

      token = {
        iss: app_name,
        iat: Time.current.utc.to_i,
        aud: opts[:application][:uid],

        jti: SecureRandom.uuid,
        sub: resource.id,
        scopes: scopes,

        resource: {
          type:       resource.class.name,
          id:         resource.id,
        },

        props: {
          name:        resource&.respond_to?(:name)        ? resource.name       : nil,
          company_id:  resource&.respond_to?(:company_id)  ? resource.company_id : resource.id,
          branch_id:   resource&.respond_to?(:branch_id)   ? resource.branch_id  : nil,
          user_id:     resource&.respond_to?(:user_id)     ? resource.user_id    : nil,
          employee_id: resource&.respond_to?(:employee_id) ? resource.branch_id  : nil,
          email:       resource&.respond_to?(:email)       ? resource.email      : nil
        },

        exp: expire_at.to_i
      }
    end

    secret_key_path 'jwt/private.pem'
    encryption_method :RS512

  end
