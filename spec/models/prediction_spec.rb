require 'rails_helper'

RSpec.describe Prediction, type: :model do
  let(:prediction) { Prediction.create!(year: 2000) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_numericality_of(:year) }
end
