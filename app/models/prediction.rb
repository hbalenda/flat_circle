class Prediction < ApplicationRecord
  validates :year, numericality: { only_integer: true }, presence: true

  def self.crystal_ball(trend, year)
    # method can only run on trends with multiple occurrences
    if trend.occurrences.count > 1
      calc_averages(trend)
      last_endyear = @occurrences.flatten.last
      if year <= last_endyear
          return true
      else
        years_into_cycle = (year - last_endyear) % @lifecycle
        if years_into_cycle >= @avg_lull
          @startyear = last_endyear + (@lifecycle * ((year - last_endyear)/@lifecycle).to_i) + @avg_lull
          @endyear = @startyear + @avg_period
          @cool = Occurrence.create!(name: trend.name, trend_id: trend.id, startyear: @startyear, endyear: @endyear)
          binding.pry
          return true
        end
      end
    end
  end

  def self.calc_averages(trend)
    # generate array of each occurrence's startyear and endyear e.g. [[1960, 1970], [1990, 2000]]
    @occurrences = trend.occurrences.pluck(:startyear, :endyear)
    @periods = []
    @lulls = []
    @occurrences.each_with_index do |x, i|
      @periods << (x.last - x.first)
      # find time between each occurrence
      @lulls << (x.first - @occurrences[i - 1].first) if i != 0
    end
    @avg_period = (@periods.sum.to_f / @periods.size).round
    @avg_lull = (@lulls.sum.to_f / @lulls.size).round
    @lifecycle = @avg_period + @avg_lull
  end
end
