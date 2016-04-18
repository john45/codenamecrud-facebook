class RemoveTableConfirmFriendship < ActiveRecord::Migration
  def change
    drop_table :confirm_friendships
  end
end
