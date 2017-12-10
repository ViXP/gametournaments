class ParticipationsController < ApplicationController
  before_action :set_tournament, only: [:participate, :stop_participation]

  def participate
    if @tournament && @tournament.participate(logged?)
      redirect_to :tournaments, status: :found
    else
      permission_denied
    end
  end

  def stop_participation
    if @tournament && @tournament.stop_participation(logged?)
      redirect_to :tournaments, status: :found
    else
      permission_denied
    end
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
