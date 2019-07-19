class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    flash[:success] ="#{favorite.post.user.name}さんのポストをお気に入り登録しました"
    redirect_to root_path
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:id]).destroy
    flash[:danger] ="#{favorite.post.user.name}さんのポストをお気に入り削除しました"
    redirect_to root_path
  end
end
