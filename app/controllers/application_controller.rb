require_relative "../../config/environment"

class ApplicationController < Sinatra::Application

  get '/tweets' do
    Tweet.new("Vanessa", "My first tweet!!! SO EXCITING OMG!!!")
    Tweet.new("Vanessa", "My second tweet!!! Still super exciting!!!")
    @tweets = Tweet.all

    erb :tweets
  end

  post '/tweets' do

  end
end