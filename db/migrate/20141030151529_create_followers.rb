class CreateFollowers < ActiveRecord::Migration
  def up
    create_table :followers do |t|
      t.integer :user_id
      t.integer :follower_id
    end
  end

  def down
    drop_table :followers
  end
end
