require 'rails_helper'

RSpec.describe Trend, type: :model do
  let(:user) { create(:user) }
  let(:trend) { create(:trend) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:user) }
end
