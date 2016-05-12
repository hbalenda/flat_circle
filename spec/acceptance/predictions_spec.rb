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

  get 'api/predictions?year=:year' do
    parameter :year, "Year"
    let(:year) { 2082 }
    example 'Reveal a Prediction' do
      explanation 'Predictions have a "year" attribute (e.g. 2082 or 1970). This request combs through the database and returns trends that were or will be "in" that year.'
      do_request
      expect(status).to eq(200)
    end
  end
end
