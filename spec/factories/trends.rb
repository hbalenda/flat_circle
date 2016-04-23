FactoryGirl.define do
  factory :trend do
    name { Faker::Hipster.word }
    user { User.all.sample }
  end
end
