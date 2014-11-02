require_relative "../../config/environment.rb"

class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :following, :class_name => "User"
end
