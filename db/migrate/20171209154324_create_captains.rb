class CreateCaptains < ActiveRecord::Migration[5.1]
  def change
    create_table :captains do |t|
      t.string :login, limit: 50, null: false, index: true
      t.string :email, limit: 150
      t.string :avatar
      t.timestamps
    end
  end
end
