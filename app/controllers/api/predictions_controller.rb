class Api::PredictionsController < ApiController
  before_action :authenticate_user

  def show
    @prediction = Prediction.find(params[:id])
    @year = @prediction.year
    arr = []
    Trend.all.each do |trend|
      arr << trend.name if @prediction.crystal_ball(trend, @year) == true
    end
    render json: arr
  end
end
