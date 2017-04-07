class SessionsController < ApplicationController
  def new ; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
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
