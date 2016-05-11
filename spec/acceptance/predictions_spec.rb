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
    parameter :prediction_id, 'Prediction ID'

    let(:prediction_id) { @prediction.id }

    example 'Reveal a Prediction' do
      explanation 'Predictions are created with a "year" attribute (e.g. 2082 or 1970). GET api/predictions/:id combs through the database and returns trends that were or will be "in" that year.'
      do_request
      expect(status).to eq(200)
    end
  end
end
