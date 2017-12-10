class AddIdToTeamsTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :teams_tournaments, :id, :primary_key
  end
end
