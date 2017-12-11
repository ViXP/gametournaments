class ParticipationsController < ApplicationController
  before_action :set_tournament, only: [:participate, :stop_participation]

  def participate
    if @tournament && @tournament.participate(logged?)
      head :ok
      #render :tournaments, remote: true, status: :found
    else
      head :bad_request
    end
  end

  def stop_participation
    if @tournament && @tournament.stop_participation(logged?)
      head :ok
      #render :tournaments, remote: true, status: :found
    else
      head :bad_request
    end
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
