require_relative "../../config/environment.rb"

class Tweet < ActiveRecord::Base
  belongs_to :user

end