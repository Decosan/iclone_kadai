class UsersController < ApplicationController
  before_action :require_user_login, only:[:index,:show,:edit]
  before_action :user_identify, only:[:show,:edit]
  before_action :set_user, only:[:show,:edit,:update,:destroy]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ='Sign up!'
      redirect_to user_path(@user)
    else
      flash.now[:danger] ='Failed..'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] ='Edit completed!'
      redirect_to user_path(@user)
    else
      flash.now[:danger] ='Failed..'
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:danger] ="Your Profile has been deleted!"
    redirect_to new_user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image,:image_cache)
  end

  def user_identify
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end
end
