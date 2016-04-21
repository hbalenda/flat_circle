require 'rails_helper'

RSpec.describe Trend, type: :model do
  let(:user) { User.create!(name: 'Hannah Violet', email: 'hannah@gmail.com', password: 'password') }
  let(:trend) { Trend.create!(name: 'New Age-iness', user_id: user.id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:user) }
end
