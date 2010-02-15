class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :basic_authenticate if RAILS_ENV == "production"
  filter_parameter_logging :password, :password_confirmation
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to logout_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def basic_authenticate
    # Given this username, return the cleartext password (or nil if not found)
    authenticate_or_request_with_http_basic("KitchenBrewer") do |username, password|
      username == "robby" && password == "robby"
    end
  end
end
