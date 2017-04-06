class UsersController < ApplicationController
  def new
    @user = User.new(create_params)
    if @user.save
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def create_params
    perams.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
