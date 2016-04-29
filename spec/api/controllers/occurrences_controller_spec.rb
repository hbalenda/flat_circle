require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe Api::OccurrencesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @trend = FactoryGirl.create(:trend, user: @user)
    @occurrence = FactoryGirl.create(:occurrence, trend_id: @trend.id)
  end

  context 'unauthenticated user' do
    it 'GET index returns http unauthenticated' do
      get :index, params: { trend_id: @trend.id }
      expect(response).to have_http_status(401)
    end

    it 'POST create returns http unauthenticated' do
      get :index, params: { trend_id: @trend.id }
      expect(response).to have_http_status(401)
    end

    it 'DELETE destroy returns http unauthenticated' do
      get :index, params: { trend_id: @trend.id }
      expect(response).to have_http_status(401)
    end
  end

  context 'Authenticated user' do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
    end

    describe 'GET index' do
      it 'returns http authenticated' do
        get :index, params: { trend_id: @trend.id }
        expect(response).to have_http_status(200)
      end

      it 'returns json content type' do
        get :index, params: { trend_id: @trend.id }
        expect(response.content_type).to eq 'application/json'
      end
    end

    describe 'POST create' do
      before do
        post :create, params: { occurrence: { name: 'Boy Bands', startyear: 2030, endyear: 2040, trend_id: @trend.id }, trend_id: @trend.id }
      end

      it 'POST create returns http authenticated' do
        expect(response).to have_http_status(:success)
      end

      it 'returns json content type' do
        expect(response.content_type).to eq 'application/json'
      end

      it 'creates a occurrence with the correct attributes' do
        hashed_json = JSON.parse(response.body)
        expect(hashed_json['name']).to eq('Boy Bands')
      end
    end

    describe 'DELETE destroy' do
      before { delete :destroy, params: { id: @occurrence.id, trend_id: @trend.id } }

      it 'DELETE destroy returns http authenticated' do
        expect(response).to have_http_status(:success)
      end

      it 'returns json content type' do
        expect(response.content_type).to eq 'application/json'
      end
    end
  end
end
