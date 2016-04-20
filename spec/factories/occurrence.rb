FactoryGirl.define do
  factory :occurrence do
    name { Faker::Hipster.words }
    startyear {}
    endyear {}
    trend_id
  end
end
