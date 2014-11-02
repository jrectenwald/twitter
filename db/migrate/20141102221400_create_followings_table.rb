class CreateFollowingsTable < ActiveRecord::Migration
  def up
    create_table :followings do |t|
      t.integer :user_id
      t.integer :following_id
    end
  end

  def down
    drop_table :followings
  end
end
