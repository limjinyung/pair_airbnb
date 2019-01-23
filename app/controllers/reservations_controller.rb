class ReservationsController < ApplicationController

	def new 
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		reservation = Reservation.new(reservations_params)

		reservation.user_id = current_user.id
		reservation.listing_id = params[:listing_id]
		
		if reservation.save
			ReservationJob.perform_later(current_user)
			# ReservationMailer.reservation_email(current_user).deliver_now
			redirect_to root_url
		else
			p 'failed to add listing'
			redirect_to root_url
		end
	end

	private

  	def reservations_params
  		params.require(:reservation).permit(:check_in_date, :check_out_date, :book_guest_number, :memo)
  	end

end


# params = { reservation: {year: 2019, month: "August"}}