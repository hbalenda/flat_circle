class Api::UsersController < ApiController
  before_action :authenticate_user
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {message: "User destroyed", status: 200}, status: 200
    else
      render json: {message: "User destroy failed", status: 400}, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
