require 'factory_girl_rails'

50.times do
  FactoryGirl.create(:user)
end

users = User.all

50.times do
  FactoryGirl.create(:trend)
end

trends = Trend.all

100.times do
  FactoryGirl.create(:occurrence)
end

occurrences = Occurrence.all

puts "#{users.count} users seeded"
puts "#{trends.count} trends seeded"
puts "#{occurrences.count} occurrences seeded"
