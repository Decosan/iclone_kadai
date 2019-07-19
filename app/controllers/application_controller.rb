class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_user_login
    unless logged_in?
      redirect_to root_path
    end
  end

  def count(user)
    @count_users = current_user.posts.count
    @count_posts = current_user.favorites.count
  end
end
