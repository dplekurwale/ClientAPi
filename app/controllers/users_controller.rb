class UsersController < ApiController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {status_code: 200}
    else
      render json: {errors: JsonWebToken.encode({message: @user.errors.full_messages}), status_code: 400}
    end
  end

  def authenticate_user
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      render json: {user: JsonWebToken.encode(user.as_json), status_code: 200}
    else
      render json: {errors: JsonWebToken.encode({message: user.errors.full_messages}), status_code: 400 }
    end
  end

  def show
    user = User.find_by(id: user_params[:id])
    if user
      render json: {user: JsonWebToken.encode(user.as_json), status_code: 200}
    else
      render json: {errors: JsonWebToken.encode({message: 'User not found'}), status_code: 400 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :mobile_number, :password, :password_confirmation, :username)
  end

end