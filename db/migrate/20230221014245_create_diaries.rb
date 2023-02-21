class CreateDiaries < ActiveRecord::Migration[4.2]
  def change
    create_table :diaries do |t|
      t.datetime :day

      t.timestamps null: false
    end
  end
end
