class FavouritesController < ApplicationController
  before_action :require_sign_in

   def create
     post = Post.find(params[:post_id])
     favourite = current_user.favourites.build(post: post)

     if favourite.save
       flash[:notice] = "Post favourited."
     else
       flash[:alert] = "Favouriting failed."
     end

    def destroy
     post = Post.find(params[:post_id])
     favourite = current_user.favourites.find(params[:id])

     if favourite.destroy
       flash[:notice] = "Post unfavorited."
     else
       flash[:alert] = "Unfavoriting failed."
     end

     redirect_to [post.topic, post]
    end
  end
end
