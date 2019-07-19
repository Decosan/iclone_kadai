class PostsController < ApplicationController
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
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end
end
