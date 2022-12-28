require 'rails_helper'

RSpec.describe "Homes", type: :request do
	describe "#index" do
	it "responds successfully" do
		get :index
		expect(response).to be_success
		end
	end
end
