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
    byebug
    # @followee=params[:user]
    @user=User.find_by_id(params[:user])
    allid=@current_user.followees.ids
    if allid.include?(@user.id)
      redirect_to search_path(token:@token)
    else
      Relationship.create(follower_id:@current_user.id,followee_id:@user.id)
      redirect_to following_path(token: @token)
    end
  end

  def deletem
    @followee=params[:user]
    Relationship.delete_by(follower_id:@current_user.id,followee_id:@followee)
    redirect_to following_path(token: @token)
  end

end


