require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Predictions' do
  before do
    @user = FactoryGirl.create(:user)
    header 'Authorization', ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
    @prediction = FactoryGirl.create(:prediction)
    50.times { FactoryGirl.create(:trend) }
    200.times { FactoryGirl.create(:occurrence, trend_id: Trend.all.sample.id) }
  end

  get 'api/predictions/:prediction_id' do
    parameter :prediction, 'Prediction'
    parameter :prediction_id, 'Prediction ID'

    let(:prediction) { @prediction }
    let(:prediction_id) { @prediction.id }

    example 'Reveal a Prediction' do
      explanation 'This combs through the database and returns the trends that will be "in".'
      do_request
      expect(status).to eq(200)
    end
  end
end
