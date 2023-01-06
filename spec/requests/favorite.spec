require 'rails_helper'

RSpec.describe "Favorite", type: :request do

  describe "POST /create" do
    it "returns http success" do
      sign_in user
      get user_step_log_favorites_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      get user_step_log_favorite_path
      expect(response).to have_http_status(:success)
    end
  end
end