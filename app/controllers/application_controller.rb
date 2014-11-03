require_relative "../../config/environment"

class ApplicationController < Sinatra::Application

  helpers do
    def signed_in?
      session[:id]
    end

    def current_user
      current_user = User.find_by(password: session[:id])
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

  post '/users' do
    User.create(:name => params[:username])
    redirect '/users'
  end

  get '/sign-in' do
    erb :signin
  end

  post '/sign-in' do
    @user = User.find_by(email: params[:email])
    if BCrypt::Password.new(@user.password) == params[:password]
      session[:id] = BCrypt::Password.new(@user.password)
      session[:error] = nil
      redirect "/users/#{@user.id}"
    else
      session[:error] = "Wrong email or password. Please try again."
      redirect "/sign-in"
    end
  end

  post '/sign-up' do
    password_hash = BCrypt::Password.create(params[:password])
    @user = User.new(name: params[:username], email: params[:email], password: password_hash)
    if @user.save
      session[:id] = password_hash
      session[:error] = nil
      redirect "/users/#{@user.id}"
    else
      session[:error] = "You've already signed up with that email address."
      redirect "/sign-in"
    end
  end

  get '/sign-out' do
    session[:id] = nil
    redirect '/tweets'
  end
end