class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_author, :logged_in?

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def logged_in?
    !!current_author
  end

  def require_user
    if !logged_in?
     flash[:danger] = "You must be logged in to perform that action"
     redirect_to root_path
    end
  end

end
