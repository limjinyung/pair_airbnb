class ReservationJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    ReservationMailer.reservation_email(current_user).deliver_now
  end
end
