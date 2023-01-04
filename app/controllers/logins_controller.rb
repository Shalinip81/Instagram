class LoginsController < ApplicationController
    skip_before_action:expiration
    include JwtToken
    def new
      @user=User.new
    end

    def create
      @user = User.find_by_username(params[:username])
      if @user.password == params[:password]
        @token = JwtToken.jwt_encode(@user.id)
        redirect_to profile_path(token: @token)
      end
    end

end

