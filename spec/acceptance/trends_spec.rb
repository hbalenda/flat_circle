require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Trends' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    5.times { FactoryGirl.create(:trend) }
    header 'Authorization', ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get 'api/trends' do
    example 'Listing All Trends' do
      explanation 'Shows all trends in the database'
      do_request
      expect(status).to eq(200)
    end
  end

  get 'api/users/:user_id/trends' do
    parameter :user_id, 'User ID'

    let(:user_id) { @user.id }

    example "Listing A User's Trends" do
      explanation 'Shows trends created by a specific user'
      do_request
      expect(status).to eq(200)
    end
  end

  post 'api/users/:user_id/trends' do
    with_options scope: :trend do
      parameter :user_id, 'User ID'
      parameter :name, 'Trend Name'
    end

    trend = FactoryGirl.create(:trend)
    let(:name) { trend.name }
    let(:user_id) { @user.id }

    example 'Create Trend' do
      explanation 'Trends have a name attribute and at least two occurrences.'
      do_request
      expect(status).to eq(200)
    end
  end
end
