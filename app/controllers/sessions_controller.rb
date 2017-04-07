class SessionsController < ApplicationController
  def new ; end

  def create
    user = User.find_by(email: login_params[:email].downcase)
    if user && user.authenticate(login_params[:password])
      redirect_to root_path and return
    else
      flash.now[:danger] = "Failed to login"
      render 'new'
    end
  end

  def destroy ; end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
