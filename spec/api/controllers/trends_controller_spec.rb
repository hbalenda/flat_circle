require 'rails_helper'

RSpec.describe Api::TrendsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @trend = FactoryGirl.create(:trend, user_id: @user.id)
  end

  context 'Unauthenticated user' do
    it 'GET index returns http unauthenticated' do
      get :index
      expect(response).to have_http_status(401)
    end

    it 'POST create returns http unauthenticated' do
      post :create, params: { trend: { name: @trend.name, user_id: @trend.user_id } }
      expect(response).to have_http_status(401)
    end

    it 'DELETE destroy returns http unauthenticated' do
      delete :destroy, params: { id: @trend.id }
      expect(response).to have_http_status(401)
    end
  end

  context 'Authenticated user' do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
    end

    it 'GET index returns http authenticated' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns json content type' do
      get :index
      expect(response.content_type).to eq 'application/json'
    end

    describe 'POST create' do
      before { post :create, params: { trend: { name: "New Trend", user_id: @trend.user_id } } }

      it 'POST create returns http authenticated' do
        expect(response).to have_http_status(:success)
      end

      it 'returns json content type' do
        expect(response.content_type).to eq 'application/json'
      end

      it 'creates a trend with the correct attributes' do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json['name']).to eq("New Trend")
      end
    end

    describe 'DELETE destroy' do
      before { delete :destroy, params: { id: @trend.id } }

      it 'DELETE destroy returns http authenticated' do
        expect(response).to have_http_status(:success)
      end

      it 'returns json content type' do
        expect(response.content_type).to eq 'application/json'
      end
    end
  end
end
