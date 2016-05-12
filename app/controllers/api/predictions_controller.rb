class Api::PredictionsController < ApiController
  before_action :authenticate_user

  def index
    @year = params[:year].to_i
    arr = []
    Trend.all.each do |trend|
      arr << trend.name if Prediction.crystal_ball(trend, @year) == true
    end
    render json: arr
  end

  private

  def prediction_params
    params.require(:prediction).permit(:year)
  end
end
