class ToppagesController < ApplicationController
  def index
    unless logged_in?
    end
    @posts = Post.all.order('created_at DESC').page(params[:page])
    if params[:back]
      @post = current_user.posts.build(post_params)
    else
      @post = current_user.posts.build
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end
end
