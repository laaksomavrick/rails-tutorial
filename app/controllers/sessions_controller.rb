class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid username/password combination"      
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
