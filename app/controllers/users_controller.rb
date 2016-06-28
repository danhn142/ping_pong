class UsersController < ApplicationController
	def create
		@user = User.new user_params
		if @user.save
			count = User.all.count
			@user.update_attribute(:rank, count.to_i)
			flash[:errors] = ["Success"]
			redirect_to new_session_path
		else
			flash[:errors] = ['Invalid']
			redirect_to :back
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
