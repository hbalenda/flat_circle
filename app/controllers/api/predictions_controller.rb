class Api::PredictionsController < ApiController
  before_action :authenticate_user

  def show
    #return each trend where crystal_ball(year) returns true
    #if future, generate prediction w/name and return json
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
