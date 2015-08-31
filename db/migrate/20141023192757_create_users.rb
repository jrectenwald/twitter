# This migration file creates a table called "users" with columns for name and email. 
class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
    end
  end

  def down
    drop_table :users
  end
end
