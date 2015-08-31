# In this file, we've created a class of User which inherits from ActiveRecord Base. 
class User < ActiveRecord::Base
	# By indicating our user has_many tweets, we give our user instances a method called "tweets."
  has_many  :tweets 
  # This tells ActiveRecord to look into the tweets table and return any tweets associated with that user in an array.
end