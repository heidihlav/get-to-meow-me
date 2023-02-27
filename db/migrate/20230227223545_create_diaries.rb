class CreateDiaries < ActiveRecord::Migration[4.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :date
      t.integer :user_id
    end
  end
end
