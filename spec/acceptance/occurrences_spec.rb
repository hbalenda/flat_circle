require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Occurrences' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    header "Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get "api/trends/:trend_id/occurrences" do
    parameter :occurrence, "Occurrence"
    parameter :name, "Name"
    parameter :startyear, "Start Year"
    parameter :endyear, "End Year"
    parameter :trend_id, "Trend ID"

    let(:trend) { FactoryGirl.create(:trend) }
    let(:trend_id) { trend.id }
    let(:occurrence) { FactoryGirl.create(:occurrence, trend_id: trend_id) }
    let(:name) { occurrence.name }
    let(:startyear) { occurrence.startyear }
    let(:endyear) { occurrence.endyear }

    example "Listing occurrences" do
      do_request
      expect(status).to eq(200)
    end
  end
end
