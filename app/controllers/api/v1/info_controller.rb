class Api::V1::InfoController < Api::V1::ApplicationController

  def who_am_i
    # Access the authenticated comapny params using @current_comapny.to_h
    respond_with token_info: @token_info, expires_at: Time.at(@token_info['exp']).utc
  end
end
