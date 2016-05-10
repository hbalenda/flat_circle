require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  before do
    @user = FactoryGirl.create(:user)
    header 'Authorization', ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  get 'api/users' do
    example 'Listing Users' do
      do_request
      expect(status).to eq(200)
    end
  end

  post 'api/users' do
    with_options scope: :user do
      parameter :user, 'User'
      parameter :name, 'Name'
      parameter :email, 'Email'
      parameter :password, 'Password'
    end

    user_2 = FactoryGirl.create(:user)
    let(:user) { user_2 }
    let(:name) { user_2.name }
    let(:email) { user_2.email }
    let(:password) { user_2.password }

    example 'Create User' do
      do_request
      expect(status).to eq(200)
    end
  end
end
