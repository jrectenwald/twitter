require_relative "../../config/environment.rb"

class User < ActiveRecord::Base
  has_many  :tweets
  has_many  :followers
  has_many  :follows, :through => :followers, :source => :follower
  has_many  :followings
  has_many  :followed_users, :through => :followings, :source => :following
end