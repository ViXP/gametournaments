class SessionsController < ApplicationController
  def create
    reset_session
    cap = Captain
      .find_or_create_by(request.env['omniauth.auth']['info'].to_h)
    if cap
      session[:captain_id] = cap.id
      redirect_to :root, notice: 'Successfully logged-in!', status: :found
    else
      destroy
    end
  end

  def destroy
    session[:captain_id] = nil
    redirect_to :root, notice: 'Logged out...', status: :see_other
  end
end
