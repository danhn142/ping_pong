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
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])

		@user.update user_params
		if @user.save
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = ['Invalid']
			redirect_to :back
		end

		
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :bio)
	end
	# def update_params
	# 	params.require(:user).permit()
	# end

end
