require 'rails_helper'

RSpec.describe "Studies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/studies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/studies/create"
      expect(response).to have_http_status(:success)
    end
  end

end
