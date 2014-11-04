require_relative "../../config/environment"

class ApplicationController < Sinatra::Application

  get '/tweets' do
    @tweets = Tweet.all
    @users = User.all
    erb :tweets
  end

  post '/tweets' do
    Tweet.create(:user_id => params[:user_id], :status => params[:status])
    redirect '/tweets'
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/sign-up' do
    @user = User.create(name: params[:name], email: params[:email])
    session[:id] = @user.id
    redirect "/users"
  end
end