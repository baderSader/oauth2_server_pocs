require 'rails_helper'

RSpec.describe "Welcomes", type: :request do

  let(:user) { create(:user) }
  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get "/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
