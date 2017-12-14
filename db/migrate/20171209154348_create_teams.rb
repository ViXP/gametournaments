class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams, id: :serial do |t|
      t.string :logo
      t.string :title, null: false
      t.references :captain, foreign_key: true
      t.timestamps
    end
    add_index :teams, :title, unique: true
  end
end
