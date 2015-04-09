require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @tweets = Tweet.all
    @users = User.all
    erb :index
  end

  get '/' do
    @tweets = Tweet.all
    @users = User.all
    erb :tweet
  end

  get '/tweet' do
    @users = User.all
    erb :tweet
  end

  post '/tweet' do
    tweet = Tweet.new(:user_id => params[:user_id], :status => params[:status])
    tweet.save
    redirect '/'
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/sign-up' do
    @user = User.new(:name => params[:name], :email => params[:email])
    @user.save
    redirect '/'
  end
end
