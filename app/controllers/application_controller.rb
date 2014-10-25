require_relative "../../config/environment"

class ApplicationController < Sinatra::Application

  helpers do
    def signed_in?
      session[:id]
    end

    def current_user
      current_user = User.find(session[:id])
    end
  end

  get '/tweets' do
    # Tweet.new("Vanessa", "My first tweet!!! SO EXCITING OMG!!!")
    # Tweet.new("Vanessa", "My second tweet!!! Still super exciting!!!")
    @tweets = Tweet.all
    @users = User.all
    erb :tweets
  end

  post '/tweets' do
    # Tweet.new(params[:user], params[:status])
    Tweet.create(:user_id => params[:user], :status => params[:status])
    redirect '/tweets'
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/users' do
    User.create(:name => params[:username])
    redirect '/users'
  end

  post '/sign-in' do
    session[:id] = params[:user]
    redirect '/tweets'
  end

  get '/sign-out' do
    session[:id] = nil
    redirect '/tweets'
  end
end