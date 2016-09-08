class Api::PredictionsController < ApiController

  def index
    @year = params[:year].to_i
    arr = []
    Trend.all.each do |trend|
      if Prediction.crystal_ball(trend, @year) == true
        arr << trend.name
      end
    end
    render json: arr
  end

  private

  def prediction_params
    params.require(:prediction).permit(:year)
  end
end
