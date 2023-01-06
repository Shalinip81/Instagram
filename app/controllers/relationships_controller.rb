class RelationshipsController < ApplicationController
  def follower
    @followers= @current_user.followers
  end

  def following
    @followees=@current_user.followees
  end

  def search
    @user=User.all
  end

  def manage
    @user=User.find_by_id(params[:user])
    all_id=@current_user.followees.ids
    if all_id.include?(@user.id)
      redirect_to search_path(token:@token)
    else
      Relationship.create(follower_id:@current_user.id,followee_id:@user.id)
      redirect_to search_path(token: @token)
    end
  end

  def deletem
    @followee=params[:user]
    Relationship.delete_by(follower_id:@current_user.id,followee_id:@followee)
    redirect_to search_path(token: @token)
  end

  def show
    byebug
    @user=User.find_by_id(params[:user])
    @posts=@user.posts
  end



end


