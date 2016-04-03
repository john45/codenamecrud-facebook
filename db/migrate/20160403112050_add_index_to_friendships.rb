class AddIndexToFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, [:requester_id, :responder_id], unique: true
  end
end
