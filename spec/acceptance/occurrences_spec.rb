require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    header "Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get "api/trends/:trend_id/occurrences" do
    parameter :id, "Trend ID"
    let(:trend) { FactoryGirl.create(:trend) }
    let(:occurrence) { FactoryGirl.create(:occurrence, trend_id: trend.id) }
    let(:trend_id) { trend.id }

    example "Listing occurrences" do
      do_request
      expect(status).to eq(200)
    end
  end
end
