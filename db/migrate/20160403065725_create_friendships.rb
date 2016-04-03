class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :responder_id
      t.integer :confirmation
      t.timestamps null: false
    end
  end
end
