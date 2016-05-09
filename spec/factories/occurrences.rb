FactoryGirl.define do
  factory :occurrence do
    startyear do
      loop do
        possible_startyear = Faker::Date.between(500.years.ago, 50.years.ago).year
        break possible_startyear if !Occurrence.exists?(startyear: possible_startyear)
      end
    end

    after(:build) do |occurrence|
      trend = Trend.all.sample
      occurrence.name = trend.name
      occurrence.trend_id = trend.id
      occurrence.endyear = occurrence.startyear + Random.rand(2...100)
    end
  end
end
