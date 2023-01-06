class CommentsController < ApplicationController
  def show_comment
  end

  def new
  end

  def create
    byebug
    Comment.create(post_id:params[:post_id],comment:params[:comment])
    redirect_to profile_path(token:@token)
  end



end
