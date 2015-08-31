class Tweet < ActiveRecord::Base
  belongs_to :user #By indicating that our Tweet belongs to a user, ActiveRecord will look into the tweet table, find the column called user_id, then go to the user table and find the User associated with that id.

end