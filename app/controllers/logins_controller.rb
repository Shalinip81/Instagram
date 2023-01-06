class LoginsController < ApplicationController
    skip_before_action:expiration
    include JwtToken

    def new
      @user=User.new
    end

    def create
      @user = User.find_by_username(params[:username])
      if @user.nil?
        flash.alert = "User not found!!"
        render :new and return
      elsif @user.password == params[:password]
        @token = JwtToken.jwt_encode(@user.id)
        redirect_to profile_path(token: @token)
      else
        flash.alert = "password wrong!!"
        render :new
      end
    end

    def logout
      byebug
      redirect_to root_path and return
    end

end

