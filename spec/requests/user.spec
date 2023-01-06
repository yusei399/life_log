require 'rails_helper'
RSpec.describe "User", type: :request do
	describe "GET /index" do
		it "returns http success" do
		get root
		expect(response).to have_http_status(:success)
		end
	end

	describe "GET /new" do
		it "returns http success" do
			sign_in user
			get new_user_session_path
			expect(response).to have_http_status(:success)
	end
	end

	describe "DELETE /destroy" do
		it "returns http success" do
			sign_in user
			get destroy_user_session_path
			expect(response).to have_http_status(:success)
	end
	end


	describe "POST /create" do
		it "returns http success" do
		sign_in user
		get user_session_path
		expect(response).to have_http_status(:success)
		end
	end
end