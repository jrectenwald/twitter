require_relative "../../config/environment"

class ApplicationController < Sinatra::Application

  helpers do
    def signed_in?
      session[:id]
    end

    def current_user
      current_user = User.find_by(session[:id])
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

  get '/users/:id' do
    @user = User.find(params[:id])
    @tweets = @user.tweets
    erb :user
  end

  get '/sign-in' do
    erb :signin
  end

  post '/sign-in' do
    @user = User.find_by(email: params[:email])
    if BCrypt::Password.new(@user.password) == params[:password]
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = "Please try again."
    end
  end

  post '/sign-up' do
    password_hash = BCrypt::Password.create(params[:password])
    @user = User.new(name: params[:username], email: params[:email], password: password_hash)
    @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get '/sign-out' do
    session[:id] = nil
    redirect '/tweets'
  end
end