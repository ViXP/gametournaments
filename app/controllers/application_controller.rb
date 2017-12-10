class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged?
    session[:captain_id] || false
  end

  def has_team?
    logged? && Team.find_by(captain_id: logged?)
  end

  helper_method :logged?, :has_team?

  private

  def permission_denied
    flash[:alert] = logged? ? 'Permission denied!' : 'Please, sign-in!'
    redirect_to :root, status: :moved_permanently
  end
end
