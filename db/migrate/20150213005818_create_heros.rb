class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :picture
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
