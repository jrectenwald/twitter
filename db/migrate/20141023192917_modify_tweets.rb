# We need to update our tweets table to keep track of the instance of the user class that it belongs to.
# Instead of storing the user name, our Tweet will store the user's id. 
# This migration removes a column called username and adds a column called user_id, which is an integer. 

class ModifyTweets < ActiveRecord::Migration
  def up
    remove_column :tweets, :username, :string
    add_column :tweets, :user_id, :integer
  end

  def down #notice that our down method is the exact opposite of our up - that way, we can undo this if needed in one go
    add_column :tweets, :username, :string
    remove_column :tweets, :user_id, :integer
  end
end
