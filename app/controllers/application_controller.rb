class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :expiration

  include JwtToken

  private
  def expiration
    begin
      @token = params[:token]
      user_id = JwtToken.jwt_decode(params[:token])['id']
      @current_user = User.find_by_id(user_id)
    rescue JWT::ExpiredSignature
      render json: { error: 'Token has expired' }
    end
  end
end
