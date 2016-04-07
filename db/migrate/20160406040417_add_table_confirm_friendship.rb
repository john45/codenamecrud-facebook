class AddTableConfirmFriendship < ActiveRecord::Migration
  def change
    create_table :confirm_friendships do |t|
      t.references :friendships, index: true
      t.boolean :confirm, default: false
      t.timestamps null: false
    end
  end
end
