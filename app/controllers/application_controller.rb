require './config/environment'
# We're now requiring our models in the environment file instead of our controller - this makes it easier to keep track. 
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # Before rendering the index page, we load up all of our tweets and users into two differnet instance variables.
    @tweets = Tweet.all
    @users = User.all
    erb :index
  end

  get '/tweet' do
    # again, we load up all of our users before we render the new tweet form. 
    @users = User.all
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
end
