class BookingsController < ApplicationController
  def index
    @bookings_i_made = Booking.where(user_id: current_user)
    @bookings_requested_to_me = Booking.all
    @bookings_requested_to_me.select do |booking|
      current_user.islands.include?(booking.island)
    end
  end
end
