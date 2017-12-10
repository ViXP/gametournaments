class TournamentsController < ApplicationController
  def index
    render :index, locals: {tournaments: Tournament.all}, status: :ok
  end

  def show
    tournament = Tournament.includes(:teams).find_by(id: params[:id])
    if tournament
      render :show, locals: {tournament: tournament}, status: :ok
    else
      redirect_to :tournaments, notice: 'Tournament is not found',
      status: :see_other
    end
  end
end
