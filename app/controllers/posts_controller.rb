class PostsController < ApplicationController
  before_action :require_user_login
  before_action :post_identify, only:[:edit,:update,:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] ='Post it!'
      redirect_to root_path
    else
      flash.now[:danger] ='Failed..'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] ='Edit complete!'
      redirect_to root_path
    else
      flash.now[:danger] ='Failed..'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:danger] ='Post deleted!!'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end

  def post_identify
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_path
    end
  end
end
