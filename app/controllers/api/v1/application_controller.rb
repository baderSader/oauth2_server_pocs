class Api::V1::ApplicationController < ActionController::Base

    include ExceptionHandler
    include JwtAuthHandler

    respond_to :json


end
