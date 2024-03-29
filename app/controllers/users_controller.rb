class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end
end
