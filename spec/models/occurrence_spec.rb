require 'rails_helper'

RSpec.describe Occurrence, type: :model do
  let(:user) { User.create!(name: 'Hannah Violet', email: 'hannah@gmail.com', password: 'password') }
  let(:trend) { Trend.create!(name: 'New Age-iness', user_id: user.id) }
  let(:occurrence) { Occurrence.create!(name: 'Hippie Movement', startyear: 1960, endyear: 1970, trend_id: trend.id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:startyear) }
  it { is_expected. to validate_uniqueness_of(:startyear) }
  it { is_expected.to validate_numericality_of(:endyear) }
  it { is_expected.to belong_to(:trend) }
end
