class ToppagesController < ApplicationController
  def index
    if logged_in?
      if params[:back]
        @posts = Post.all.order('created_at DESC').page(params[:page])
        @post = current_user.posts.build(post_params)
      else
        @posts = Post.all.order('created_at DESC').page(params[:page])
        @post = current_user.posts.build
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end
end
