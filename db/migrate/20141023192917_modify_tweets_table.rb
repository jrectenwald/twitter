class ModifyTweetsTable < ActiveRecord::Migration
  def up
    remove_column :tweets, :user_name, :string
    add_column :tweets, :user_id, :integer
  end

  def down
    add_column :tweets, :user_name, :string
    remove_column :tweets, :user_id, :integer
  end
end
