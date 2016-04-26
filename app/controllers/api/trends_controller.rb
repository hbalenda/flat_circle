class Api::TrendsController < ApiController
  before_action :authenticate_user
  after_create :create_prediction

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
    trend.destroy
    render json: {}, status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def create_prediction
    trend = Trend.find(params[:id])
    Prediction.create(trend_id: trend.id)
  end

  private

  def trend_params
    params.require(:trend).permit(:name, :user_id)
  end
end
