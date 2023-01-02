class LoginsController < ApplicationController

  def new
    @user=User.new
  end

  def create
    # byebug
    @user=User.find_by_username(params[:username])
    if @user.nil?
      flash.alert = "User not found."
      render :new and return
    else
      if @user.password == params[:password]
        redirect_to @user and return
      end
      render :new
    end
  end

end

