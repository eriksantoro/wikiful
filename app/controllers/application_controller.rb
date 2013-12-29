class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_categories




=begin
the following says that if current_user is not already defined, 
we set it to the user id that is the current session id (e.g. what logged in as)
=end

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user #allows us to access this method in view templates

  private
  def get_categories
    @categories = Category.all.order(:name)
  end

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end
