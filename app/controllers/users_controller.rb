class UsersController < ApiController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
    end
    render json: @user
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
