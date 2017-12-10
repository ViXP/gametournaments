class Participation < ApplicationRecord
  self.table_name = :teams_tournaments
  
  # Associations
  belongs_to :team
  belongs_to :tournament

  def self.participates? captain_id
    team = Team.find_by(captain_id: captain_id)
    find_by(team_id: team.id) if team
  end

  def self.participants_number
    count
  end

  def self.participate captain_id
    team = Team.find_by(captain_id: captain_id)
    return false unless team && create(team: team, tournament: first.tournament)
    true
  end

  def self.stop_participation captain_id
    team = Team.find_by(captain_id: captain_id)
    return false unless team && first.tournament.teams.delete(team)
    true
  end
end