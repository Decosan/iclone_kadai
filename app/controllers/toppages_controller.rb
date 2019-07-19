class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = Post.all.order('created_at DESC').page(params[:page])
      @post = current_user.posts.build
    end
  end
end
