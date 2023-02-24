class AddDiaryIdToCats < ActiveRecord::Migration[4.2]
  def change
    add_column :cats, :diary_id, :integer 
  end
end
