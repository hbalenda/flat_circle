FactoryGirl.define do
  factory :trend do
    name do
      # ensure uniqueness of trend name
      loop do
        possible_name = Faker::Hipster.word
        break possible_name unless Trend.exists?(name: possible_name)
      end
    end

    user { User.all.sample }
  end
end
