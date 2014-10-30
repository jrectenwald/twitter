require_relative "../../config/environment.rb"

class User < ActiveRecord::Base
  has_many  :tweets
  has_many  :followers
  has_many  :following
  validates :email, uniqueness: true 

end