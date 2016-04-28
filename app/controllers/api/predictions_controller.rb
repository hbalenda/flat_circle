class Api::PredictionsController < ApiController
  before_action :authenticate_user

  def show
    @prediction = Prediction.find(params[:id])
    @year = @prediction.year
    arr = []
    Trend.all.each do |trend|
      if @prediction.crystal_ball(trend, @year) == true
        arr << trend.name
      end
    end
    render json: arr
  end
end
