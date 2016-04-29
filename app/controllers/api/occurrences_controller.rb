class Api::OccurrencesController < ApiController
  before_action :authenticate_user

  def index
    occurrences = Occurrence.all
    render json: occurrences, each_serializer: OccurrenceSerializer
  end

  def create
    occurrence = Occurrence.new(occurrence_params)
    if occurrence.save
      render json: occurrence
    else
      render json: { errors: occurrence.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    occurrence = Occurrence.find(params[:id])
    if occurrence.destroy
      render json: { message: 'Occurrence destroyed', status: 200 }, status: 200
    else
      render json: { message: 'Occurrence destroy failed', status: 400 }, status: 400
    end
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(:name, :trend_id, :startyear, :endyear)
  end
end
