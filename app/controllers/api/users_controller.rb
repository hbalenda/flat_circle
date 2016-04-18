class Api::UsersController < ApiController
  before_action :authenticate_user
  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end
end
