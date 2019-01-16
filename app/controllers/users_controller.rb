class UsersController < Clearance::UsersController

	def show 
		user_id = current_user.id
		@reservation = Reservation.where(user_id: user_id)
	end

	private

	def user_from_params
		# Add in original code from Clearance GitHub (user controller)
		# Add in additional fields like first name, last name
	end

end