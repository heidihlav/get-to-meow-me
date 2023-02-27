class CreateCats < ActiveRecord::Migration[4.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :mood
      t.string :behavior
      t.integer :user_id
      t.integer :diary_id
    end
  end
end
