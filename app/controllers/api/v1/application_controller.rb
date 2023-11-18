class Api::V1::ApplicationController < ActionController::Base
   
    include JwtAuthHandler
    include ExceptionHandler

    respond_to :json


end
