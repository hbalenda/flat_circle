class Api::OccurrencesController < ApiController
  before_action :authenticate_user

  def index
    occurrences = Occurrence.all
    render json: occurrences, each_serializer: OccurrenceSerializer
  end

  def create
    occurrence = Occurrence.new(occurrence_params)
    if occurrence.save
      render json: trend
    else
      render json: { errors: occurrence.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    occurrence = Occurrence.find(params[:id])
    occurrence.destroy
    render json: {}, status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(:name, :trend_id, :startyear, :endyear)
  end
end
