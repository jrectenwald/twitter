require_relative "../../config/environment.rb"

class Tweet < ActiveRecord::Base
  belongs_to :user

  # attr_accessor :user, :status
  
  # @@all = []

  # def initialize(user, status)
  #   @user = user
  #   @status = status
  #   # @@all << self
  # end

  # def user
  #   @user
  # end

  # def status
  #   @status
  # end

  # def self.all
  #   @@all
  # end
end