require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Trends' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    header "Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get "api/trends" do
    example "Listing trends" do
      do_request
      expect(status).to eq(200)
    end
  end

  post "api/trends" do
    parameter :trend, "Trend"
    parameter :name, "Trend Name"

    let(:trend) { FactoryGirl.create(:trend) }
    let(:name) { trend.name }

    example "Create Trend" do
      do_request
      expect(status).to eq(200)
    end
  end
end
