class Api::V1::InfoController < ApplicationController
    include JwtAuthHandler
    include ExceptionHandler
    
    respond_to :json
  
    # GET /who_am_i.json
    def who_am_i
      # Access the authenticated comapny using @current_comapny
      respond_with data: { company: @current_company.to_h, credentials: { iss: @auth_application, scopes: @auth_scopes } }
    end
  end