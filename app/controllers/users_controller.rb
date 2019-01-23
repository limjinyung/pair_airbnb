class UsersController < Clearance::UsersController

	def create
		user = User.new(user_from_params)

		if user.save
			redirect_to sign_in_path
		else
			p 'failed to sign up'
			redirect_to sign_up_path
		end
	end

	def show 
		user_id = current_user.id
		@reservation = Reservation.where(user_id: user_id)
	end

	private

	def user_from_params
		# Add in original code from Clearance GitHub (user controller)
		# Add in additional fields like first name, last name
		params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :gender, :phone_number, :country)

	end

end