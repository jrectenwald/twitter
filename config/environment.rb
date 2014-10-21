require 'sinatra'
require 'pry'
require 'bundler'
Bundler.require

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end