class RelationshipsController < ApplicationController
  def follower
    byebug
    @followers= @current_user.followers
  end

  def following
    byebug
    @following=@current_user.followees
  end
end
