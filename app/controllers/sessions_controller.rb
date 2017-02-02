class SessionsController < ApplicationController

  def new
    create
  end

  def create

  	@user = User.find_by_email(params[:sessions][:email])
    # If the user exists AND the password entered is correct
    binding.pry
    if @user and @user.authenticate(params[:sessions][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      puts "WHAAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah"
      redirect_to 'success'
    else
    # If user's login doesn't work, send them back to the login form.
      puts "WHAAooooooooooooooooooooooooooooooooooooh"
      redirect_to 'doh'
    end
  end

  def destroy
  end

end
