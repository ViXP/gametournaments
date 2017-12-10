class SessionsController < ApplicationController
  def create
    reset_session
    p request.env['omniauth.auth']
    cap = Captain
      .find_or_create_by(request.env['omniauth.auth']['info'].to_h)
    if cap
      session[:captain_id] = cap.id
      flash[:notice] = 'Successfully logged-in!'
      status = :found
    else
      destroy
      flash[:alert] = 'Wrong credentials!'
      status = :see_other
    end
    redirect_to :root, status: status
  end

  def destroy
    session[:captain_id] = nil
    redirect_to :root, notice: 'Logged out...', status: :see_other
  end
end