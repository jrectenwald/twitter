require_relative "../../config/environment.rb"

class User < ActiveRecord::Base
  has_many  :tweets

end