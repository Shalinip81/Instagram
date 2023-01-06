class LikesController < ApplicationController
  def like
    byebug
    a=User.find_by_id(params[:user_id])
    Like.create(post_id:params[:post_id])
    redirect_to showprofile_path(token:@token,post:params[:post_id],user:a.id)
  end

  def unlike
    byebug
    Like.delete_by(params[:post_id])
  end
end
