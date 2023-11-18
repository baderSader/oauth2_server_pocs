class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :store_user_location!, if: :storable_location?

  private

  # Store the current location so we can redirect back to it after sign in.
  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  # Determine if the current request is storable.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || super
  end
end
