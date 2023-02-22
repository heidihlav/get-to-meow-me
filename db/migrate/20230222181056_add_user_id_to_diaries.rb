class AddUserIdToDiaries < ActiveRecord::Migration[4.2]
  def change
    add_column :diaries, :user_id, :integer 
  end

end
