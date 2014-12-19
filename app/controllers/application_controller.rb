require_relative "../../config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/tweets' do
    @tweets = Tweet.all
    @users = User.all
    erb :tweets
  end

  post '/tweets' do
    tweet = Tweet.new(:user_id => params[:user_id], :status => params[:status])
    tweet.save
    redirect '/tweets'
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/sign-up' do
    @user = User.new(:name => params[:name], :email => params[:email])
    @user.save
    redirect '/tweets'
  end
end