class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:authenticated] = false
      redirect_to "/users/#{user.id}"
    else
      flash[:LI_errors] = ["Invalid Login"]
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:authenticated] = nil
    redirect_to '/sessions'
  end
end
