class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :confirm_friendships, :friendships_id, :friendship_id
  end
end
