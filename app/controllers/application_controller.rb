# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #helper :all # include all helpers, all the time
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def logged_in?
    unless current_user
      redirect_to login_url
    end
  end
    
  private
    def current_user_session
      @current_user_session ||= UserSession.find(1)
    end
    
    def current_user
      @current_user ||= current_user_session && current_user_session.record
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
        redirect_to user_url(current_user)
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  
end
