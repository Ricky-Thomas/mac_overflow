class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def is_owned_by?(current_user)
    self.user_id == current_user.id
  end

  def viewing_own_profile?(current_user)
    @user.id == current_user.id
  end

  helper_method :current_user
  helper_method :viewing_own_profile?
end
