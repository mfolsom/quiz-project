class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.username}!"
    else
      redirect_to new_user_path, error: user.errors.keys[0].to_s.capitalize.gsub('_', ' ') + ' ' + user.errors.values[0][0]
    end
  end

  def sign_in
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
