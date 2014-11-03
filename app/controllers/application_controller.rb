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

  get '/sign-in' do
    erb :signin
  end

  post '/sign-in' do
    @user = User.find_by(email: params[:email])
    session[:id] = @user.id
    redirect "/tweets"
  end

  post '/sign-up' do
    @user = User.create(name: params[:username], email: params[:email])
    session[:id] = @user.id
    redirect "/tweets"
  end

  get '/sign-out' do
    session[:id] = nil
    redirect '/tweets'
  end
end