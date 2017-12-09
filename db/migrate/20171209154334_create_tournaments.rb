class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :title, limit: 250, null: false
      t.timestamps
    end
  end
end
