class UsersController < ApplicationController
  def index
    @users=User.all
    render :index
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # WelcomeMailer.create_mail(@user).deliver_now
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to (@user)
    else
      render :edit
    end
  end

  def abc
  end



  private
    def user_params
      params.require(:user).permit(:name,:email,:phone_number,:username,:password,:password_confirmation,:account_type,:profile_picture)
    end

end
