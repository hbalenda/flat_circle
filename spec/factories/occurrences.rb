FactoryGirl.define do
  factory :occurrence do
    after(:build) do |occurrence|
      trend = Trend.all.sample
      occurrence.name = trend.name
      occurrence.trend_id = trend.id
      @startyear = Faker::Date.between(500.years.ago, 50.years.ago).year
      occurrence.startyear = @startyear
      occurrence.endyear = @startyear + Random.rand(2...100)
    end
  end
end
