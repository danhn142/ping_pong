class UsersController < ApplicationController
	def create
		@user = User.new user_params
		if @user.save
			session[:user_id] = @user.id
			count = User.all.count
			@user.update_attribute(:rank, count.to_i)
			# authy = Authy::API.register_user(
			# 	email: @user.email,
			# 	cellphone: '+1'+@user.phone,
			# )
			# @user.update(authy_id: authy.id)
			# Authy::API.request_sms(id: @user.authy_id)
			# redirect_to '/users/verify_now'
			ConfirmationSender.send_confirmation_to(@user)
			redirect_to '/confirmations'
		else
			flash[:errors] = ['Invalid']
			redirect_to '/sessions/new'
		end
	end

	# def show_verify
	# 	return redirect_to new_user_path unless session[:user_id]
	# end
	#
	# def verify
	# 	@user = current_user
	# 	token = Authy::API.verify(id: @user.authy_id, token: params[:token])
	# 	if token.ok?
	# 		@user.update(verified: true)
	# 		send_message("Signup complete!")
	# 		redirect_to '/users/@user.id'
	# 	else
	# 		flash.now[:danger] = "Incorrect code, please try again"
	# 		render :show_verify
	# 	end
	# end
	#
	# def resend
	# 	@user = current_user
	# 	Authy::API.request_sms(id: @user.authy_id)
	# 	flash[:notice] = "Verification code re-sent"
	# 	redirect_to '/users/verify_now'
	# end

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
		params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :avatar, :bio)
	end
	def send_message(message)
		@user = current_user
		twilio_number = ENV['TWILIO_NUMBER']
		@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
		message = @client.account.message.create(
			:from => twilio_number,
			:to => '+1'+@user.phone,
			:body => message
		)
	end

end
