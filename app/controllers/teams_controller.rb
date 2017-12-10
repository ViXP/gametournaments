class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]

  def index
    render :index, locals: {teams: Team.all}, status: :ok
  end

  def show
    team = Team.find_by(id: params[:id])
    if team
      render :show, locals: {team: team}, status: :ok
    else
      redirect_to :root, notice: 'Incorrect team id', status: :moved_permanently
    end
  end

  def new
    permission_denied unless logged?
    team = Team.find_by(captain_id: logged?)
    if team
      redirect_to edit_team_path(team.id)
    else
      render :new, locals: {team: Team.new}
    end
  end

  def edit
    if @team
      render :edit, locals: {team: @team}, status: :ok
    else
      permission_denied
    end
  end

  def create
    permission_denied unless logged?
    team = Team.new(team_params.merge(captain_id: logged?))
    if team.save
      redirect_to team, notice: 'Team was successfully created',
        status: :found
    else
      render :new, locals: {team: team}, status: :not_acceptable
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated', status: :found
    elsif @team
      render :edit, locals: {team: @team}, status: :not_acceptable
    else
      permission_denied
    end
  end

  def destroy
    if @team && @team.destroy
      redirect_to :teams, notice: 'Team was successfully destroyed.', 
        status: :found
    else
      permission_denied
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by(id: params[:id], captain_id: logged?)
    end

    def team_params
      params.require(:team).permit(:title, :logo)
    end
end
