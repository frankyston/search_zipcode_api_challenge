require 'rails_helper'

RSpec.describe "Api Request" do

  describe 'GET #test' do
    let(:user) { create(:user) }
    before do
      @token = AuthToken.issue_token({ user_id: user.id })
    end

    it 'return Unauthorized' do
      headers = { "ACCEPT" => "application/json" }
      get '/api/test', :headers => headers
      expect(response).to have_http_status(:unauthorized)
    end

    it 'return sample data' do
      headers = { "ACCEPT" => "application/json", "Authorization" => @token }
      get '/api/test', :headers => headers
      expect(response).to have_http_status(:success)
    end
  end
end
