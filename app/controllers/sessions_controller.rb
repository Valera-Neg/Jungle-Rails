class SessionsController < ApplicationController
  # before_filter :authorize

  
  def new 
  end


  def create 
    user = User.find_by_email(params[:email])
   
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user 
      session[:user_id] = user.id
      redirect_to '/', notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      redirect_to '/login'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'Logged Out'
  end

  
end
