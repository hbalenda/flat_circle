FactoryGirl.define do
  factory :prediction do
    year { Faker::Date.between(500.years.ago, 500.years.from_now).year }
  end
end
