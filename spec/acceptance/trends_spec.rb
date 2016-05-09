require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Trends' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    header "Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get "api/users/:user_id/trends" do
    parameter :trend, "Trend"
    parameter :name, "Trend Name"
    parameter :user_id, "User ID"

    let(:trend) { FactoryGirl.create(:trend) }
    let(:name) { trend.name }
    let(:user_id) { @user.id }

    example "Listing trends" do
      do_request
      expect(status).to eq(200)
    end
  end
end
