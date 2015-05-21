# Fwitter Project!

This iteration of the Fwitter project focuses on adding a User class and ActiveRecord relationships to associate tweets to a specific user.

+ `user.rb`: 
  * First we need to create a new model for our User class. This class inherits from ActiveRecord::Base
  * We need to associate users to tweets, so inside the User class, we add `has_many :tweets`

+ `tweet.rb`:
  * Next we need to associate tweets to users through `belongs_to :user`

+ `layout.rb`: 
  * There are some elements that are on every single view in our app. Instead of copying and pasting the same HTML on every page, we can use a layout. Sinatra automatically loads the this file on every view.
  * When the code its the `<% yield%>`, the rest of the correct view will load. If we wanted to laod `tweet.erb`, the header from the layout will load, then the code of `tweet.erb` followed by the footer in `layout.erb`
  * The footer contains links to two different views `/tweets` which displays all the tweets and `/users` which displays all the users.

+ `index.erb`:
  * We need to update the page that displays all the tweets so that it also displays the user that tweeted.
```ruby
<%= tweet.user.name %>
```

+ `users.erb`:
  * Users need to be able to sign up for Fwitter, so we need a sign-up form
  * The form sends an HTTP POST request to `/sign-up`
  * Users have to fill out their name and email. They get sent to the controller with the keys name and email (based on the `name` attribute of the input tag)

+ `application_controller.rb`:
  * We need a controller action to process the form from the sign-up page. This action needs to handle a POST request to `/sign-up`.
    * This controller action uses information from the `params` hash to create a new instance of the User class and save it to the database.
  * `get '/tweets'` is a route that displays loads `tweet.rb` to display all the tweets
  * `get '/users'` is a route that loads `users.erb`, which is the sign-up form.