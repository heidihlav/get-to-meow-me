class AddTitleToDiaries < ActiveRecord::Migration[4.2]
  def change
    add_column :diaries, :title, :string 
  end
end
