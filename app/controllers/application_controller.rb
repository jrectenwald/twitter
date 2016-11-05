require './config/environment'
# We're now requiring our models in the environment file instead of our controller - this makes it easier to keep track. 
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'bubbles'
  end
  
  helpers do
    def signed_in?
      session[:user_id]
    end

    def current_user
      current_user = User.find(session[:user_id])
    end
  end

  get '/' do
    # Before rendering the index page, we load up all of our tweets and users into two differnet instance variables.
    @tweets = Tweet.all
    @users = User.all
    erb :index
  end

  get '/tweet' do
    # again, we load up all of our users before we render the new tweet form. 
    @user = current_user if session[:user_id]
    erb :tweet
  end

  post '/tweet' do
    # Now, when we create a tweet, we pass in a user_id from the form instead of a username. 
    tweet = Tweet.new(:user_id => params[:user_id], :status => params[:status])
    tweet.save
    redirect '/'
  end

  get '/users' do
    @users = User.all
    erb :users
  end

  post '/sign-up' do
    # Here, we can create a new user, the same way we create new tweets. 
    @user = User.new(:name => params[:name], :email => params[:email])
    @user.save
    redirect '/'
  end
  
  post '/sign-in' do
    @user = User.find_by(:email => params[:email], :name => params[:name])
    if @user
      session[:user_id] = @user.id
    end
    redirect '/tweet'
  end
  
  get '/sign-out' do
    session[:user_id] = nil
    session[:error] = nil
    redirect '/'
  end
end
