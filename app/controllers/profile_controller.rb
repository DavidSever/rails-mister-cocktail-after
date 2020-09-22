class ProfileController < ApplicationController
  def index
    @user = User.find(params[:id])
    @cocktails = current_user.cocktails
    render index
  end
end
