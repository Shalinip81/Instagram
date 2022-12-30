class LoginsController < ApplicationController

  def new
    @user = User.find_by_username(params[:username])
  end

  def create
    byebug
    @user = User.find_by_username(params[:username])
    if @user.username == params[:username] && @user.password == params[:password]
      render :show
    end
  end




  private
    def user_params
      params.require(:user).permit(:username,:password)
    end
end
