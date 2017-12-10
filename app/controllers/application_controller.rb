class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged?
    session[:captain_id] || false
  end

  helper_method :logged?
end
