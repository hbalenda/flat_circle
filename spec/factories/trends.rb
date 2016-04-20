FactoryGirl.define do
  factory :trend do
    name { Faker::Hipster.words }
  end
end
