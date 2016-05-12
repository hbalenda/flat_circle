require 'rails_helper'

RSpec.describe Api::PredictionsController, type: :controller do
  let(:user) { create(:user) }
  let(:trend) { create(:trend) }
  let(:occurrence_1) { create(:occurrence, trend: trend) }
  let(:occurrence_2) { create(:occurrence, trend: trend) }
  let(:prediction) { create(:prediction) }

  context 'unauthenticated user' do
    it 'GET show returns http unauthenticated' do
      get :index, params: { id: prediction.id }
      expect(response).to have_http_status(401)
    end
  end

  context 'authenticated user' do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token)
    end

    it 'GET show returns http authenticated' do
      get :index, params: { id: prediction.id }
      expect(response).to have_http_status(200)
    end

    it 'returns json content type' do
      get :index, params: { id: prediction.id }
      expect(response.content_type).to eq 'application/json'
    end
  end
end
