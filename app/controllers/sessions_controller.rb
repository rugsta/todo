class SessionsController < ApplicationController

  def new
    create
  end

  def create

  	user = User.find_by_email(params[:sessions][:email])
    # If the user exists AND the password entered is correct
    if user and user.authenticate(params[:sessions][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      session[:name] = user.name
      puts "task path"
      redirect_to tasks_path
    else
    # If user's login doesn't work, send them back to the login form.
      puts "hello path"
      redirect_to root_path
    end
  end

  def destroy
  end

end
