class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :logo
      t.string :title, index: true, null: false
      t.references :captain, foreign_key: true
      t.timestamps
    end
  end
end
