class Prediction < ApplicationRecord

  def crystal_ball(trend, year)
    calc_averages(trend)
    last_endyear = @occurrences.flatten.last
    if year <= last_endyear
      @occurrences.any? {|x| year.between?(x.first, x.last)}
    else
      prediction = (year - last_endyear) % (@avg_period + @avg_lull)
      if (prediction > @avg_lull)
        true
      else
        false
      end
    end
  end

  def calc_averages(trend)
    #generate array of each occurrence's startyear and endyear e.g. [[1960, 1970], [1990, 2000]]
    @occurrences = trend.occurrences.pluck(:startyear, :endyear)
    @periods = []
    @lulls = []
    @occurrences.each_with_index do |x, i|
      @periods << (x.last - x.first)
      #find time between each occurrence
      if i != 0
        @lulls << (x.first - @occurrences[i-1].first)
      end
    end
    @avg_period = (@periods.sum.to_f / @periods.size).round
    @avg_lull = (@lulls.sum.to_f / @lulls.size).round
  end
end
