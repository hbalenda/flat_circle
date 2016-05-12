require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Occurrences' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @trend = FactoryGirl.create(:trend, user: @user)
    @occurrence_1 = FactoryGirl.create(:occurrence, trend_id: @trend.id)
    @occurrence_2 = FactoryGirl.create(:occurrence, trend_id: @trend.id)
    header 'Authorization', ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get 'api/trends/:trend_id/occurrences' do
    parameter :trend_id, 'Trend ID'

    let(:trend) { @trend }
    let(:trend_id) { @trend.id }

    example 'Listing Occurrences' do
      explanation 'Shows occurrences belonging to a specified trend.'
      do_request
      expect(status).to eq(200)
    end
  end

  post 'api/trends/:trend_id/occurrences' do
    with_options scope: :occurrence do
      parameter :occurrence, 'Occurrence'
      parameter :name, 'Name'
      parameter :startyear, 'Start Year'
      parameter :endyear, 'End Year'
      parameter :trend_id, 'Trend ID'
    end

    user = FactoryGirl.create(:user)
    trend = FactoryGirl.create(:trend, user_id: user.id)
    occurrence = FactoryGirl.create(:occurrence, trend_id: trend.id)
    let(:trend) { trend }
    let(:trend_id) { trend.id }
    let(:occurrence) { occurrence }
    let(:name) { occurrence.name }
    let(:startyear) { occurrence.startyear }
    let(:endyear) { occurrence.endyear }

    example 'Create Occurrence' do
      explanation 'Occurrences are instances of a trend with a distinct start and end year. A trend must have at least two occurrences to be used to generate future occurrences.'
      do_request
      expect(status).to eq(200)
    end
  end
end
