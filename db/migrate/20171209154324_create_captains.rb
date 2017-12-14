class CreateCaptains < ActiveRecord::Migration[5.1]
  def change
    create_table :captains, id: :serial do |t|
      t.string :login, limit: 50, null: false
      t.string :email, limit: 150
      t.string :avatar
      t.timestamps
    end
    add_index :captains, :login, unique: true
  end
end
