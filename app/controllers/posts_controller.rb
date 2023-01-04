class PostsController < ApplicationController

  def index
    @post=Post.all
  end

  def new
    byebug
    @post=Post.new
  end

  def create
    byebug
    user_id = @current_user.id
    @post = Post.new(post_params)
    @post.user_id=user_id
    if @post.save
      redirect_to profile_path(token:@token)
    else
      render :new
    end
  end

  private
    def post_params
      byebug
      params.permit(:user_id,:post_feed,:Description)
    end

end
