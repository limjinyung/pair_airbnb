class ReservationMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
	def reservation_email(user)
		@user = user
	    mail(to: @user.email, subject: 'A new booking!')
	end
end
