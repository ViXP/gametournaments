class TournamentsController < ApplicationController
  def index
    respond_to do |format|
      format.html do 
        render :index, 
          locals: {tournaments: Tournament.all},
          status: :ok
      end
    end
  end

  def show
  end
end
