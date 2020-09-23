class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @cocktails = current_user.cocktails
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :bio, :username, :photo)
  end


end
