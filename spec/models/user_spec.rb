require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.create!(name: "Hannah Violet", email: "hannah@gmail.com", password: "password") }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3)}
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(3)}
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should respond to name, email, username, and password" do
      expect(user).to have_attributes(name: user.name, email: user.email)
    end

    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end

  describe "invalid user" do
    let(:user_without_name) { User.create(name: "", email: "hcbviolet@gmail.com", password: "password") }
    let(:user_without_email) { User.create(name: "Super User", email: "", password: "password") }

    it "should be invalid due to empty name" do
      expect(user_without_name).to_not be_valid
    end

    it "should be invalid due to empty email" do
      expect(user_without_email).to_not be_valid
    end
  end
end
