class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.string :name
      t.integer :value
      t.string :picture
      t.integer :user_id
      t.integer :hero_id

      t.timestamps null: false
    end
  end
end
