class SessionsController < ApplicationController

  def create
    #find our user
  	@current_user = User.find_by_email(params[:sessions][:email].downcase)

    # If the user exists AND the password entered is correct
    if @current_user and @current_user.authenticate(params[:sessions][:password])
      log_in(@current_user)
      redirect_to tasks_path
    else
      reset_session
      @current_user = nil
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    @current_user = nil
    redirect_to root_path
  end

end
