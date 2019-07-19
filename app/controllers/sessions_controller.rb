class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] ='Login!!'
      redirect_to user_path(user.id)
    else
      flash[:danger] ='Failed..'
      render 'toppages/index'
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] ='Logout!!'
    redirect_to root_path
  end
end
