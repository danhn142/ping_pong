class ConfirmationsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find params[:user_id]
    if @user.verification_code = params[:verification_code]
      @user.confirm!
      session[:autheticated] = true
      flash[:notice] = "Welcome #{@user.first_name}!"
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "Verification code incorrect."
      redirect_to :back
    end
  end
end
