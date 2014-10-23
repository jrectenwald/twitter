require 'sinatra'
require 'pry'
require 'bundler'
Bundler.require

require './app/models/tweet'

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end

configure :development do
  set :database, "sqlite3:///db/database.db"
end