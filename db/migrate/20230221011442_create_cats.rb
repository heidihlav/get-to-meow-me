class CreateCats < ActiveRecord::Migration[4.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :mood
      t.string :behavior

      t.timestamps null: false
    end
  end
end
