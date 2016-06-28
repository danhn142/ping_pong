class UsersController < ApplicationController
	def create
		@user = User.new user_params
		if @user.save
			redirect_to new_session_path
		else
			flash[:errors] = ['Invalid']
			redirect_to :back
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
