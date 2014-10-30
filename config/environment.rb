require 'sinatra'
require 'pry'
require 'bundler'
require 'bcrypt'
Bundler.require

require './app/models/tweet'
require './app/models/user'
require './app/models/follower'
require './app/models/following'

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, 'fwitter'
end

configure :development do
  set :database, "sqlite3:///db/database.db"
end