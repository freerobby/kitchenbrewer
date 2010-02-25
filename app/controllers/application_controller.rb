class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password, :password_confirmation
  
  rescue_from Acl9::AccessDenied, :with => :deny_access
  
  private
  def deny_access
    render :file => "#{Rails.public_path}/401.html", :status => :unauthorized
  end
  
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
end
