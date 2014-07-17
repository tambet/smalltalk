class ApplicationController < ActionController::Base
  before_action :authenticate
  protect_from_forgery with: :null_session

  protected
  def authenticate
    authenticate_cookie || render_unauthorized
  end

  def authenticate_cookie
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def render_unauthorized
    render json: 'Unauthorized', status: 401
  end
  
end
