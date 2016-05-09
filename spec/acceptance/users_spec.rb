require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    header "Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get "api/users" do
    example "Listing users" do
      do_request
      expect(status).to eq(200)
    end
  end
end
