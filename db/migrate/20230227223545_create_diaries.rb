class CreateDiaries < ActiveRecord::Migration[4.2]
  def change
    create_table :diaries do |t|
      t.string :mood
      t.string :behavior
      t.datetime :date
      t.integer :user_id
      t.integer :cat_id
    end
  end
end
