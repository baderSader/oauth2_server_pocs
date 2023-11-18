class Api::V1::InfoController < Api::V1::ApplicationController

  def who_am_i
    # Access the authenticated comapny params using @current_comapny.to_h
    respond_with data: { company: @current_company.to_h, credentials: { iss: @auth_application, scopes: @auth_scopes } }
  end
end