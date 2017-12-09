class CreateCaptains < ActiveRecord::Migration[5.1]
  def change
    create_table :captains do |t|
      t.string :login, limit: 50, null: false, index: true
      t.string :email, limit: 150, null: false, index: true
      t.string :password, null: false
      t.string :salt, null: false
      t.timestamps
    end
  end
end
