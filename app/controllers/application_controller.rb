class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery

  def current_user
    if session[:user_id]
      # @current_userがnilかfalseならログインユーザーを代入
      @current_user ||= User.find_by(user_id: session[:user_id])
    end
  end

  helper_method :current_user
end
