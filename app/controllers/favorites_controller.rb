class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      flash[:notice] = "You have favorited the post!"
      redirect_to topic_post_url(@post.topic, @post)
    else
      flash[:notice] = "There was an error in favoriting the post."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    if favorite.destroy
      flash[:notice] = 'Unfavorited the post'
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = 'Could not unfavorite post. Try again?'
      redirect_to [@post.topic, @post]
    end
  end
end
