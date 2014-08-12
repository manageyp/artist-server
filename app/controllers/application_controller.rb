class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def auth_login
    if session[:artist_id].present?
      @artist_id = session[:artist_id]
    else
      redirect_to users_login_path
    end
  end
end
