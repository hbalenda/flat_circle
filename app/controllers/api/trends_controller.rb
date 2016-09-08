class Api::TrendsController < ApiController
  def index
    trends = Trend.all
    render json: trends, each_serializer: TrendSerializer
  end

  def create
    trend = Trend.new(trend_params)
    if trend.save
      render json: trend
    else
      render json: { errors: trend.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    trend = Trend.find(params[:id])
    if trend.destroy
      render json: { message: 'Trend destroyed', status: 200 }, status: 200
    else
      render json: { message: 'Trend destroy failed', status: 400 }, status: 400
    end
  end

  private

  def trend_params
    params.require(:trend).permit(:name, :user_id)
  end
end
