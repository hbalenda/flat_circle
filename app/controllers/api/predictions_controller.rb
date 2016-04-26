class Api::PredictionsController < ApiController
  before_action :authenticate_user

  def create
    Prediction.new(prediction_params)
  end

  def index
    #return each trend where crystal_ball(year) returns true
    #if future, generate prediction w/name and return json
    Trend.find_each do |trend|
      trend.predictions.crystal_ball(year) == true
    end
  end

  private

  def prediction_params
    params.require(:prediction).permit(:name)
  end
end
