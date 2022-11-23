class BookingsController < ApplicationController
  before_action :set_island, only: %i[new create]
  before_action :set_user, only: %i[new create]

  def index
    @bookings_i_made = Booking.where(user_id: current_user)
    @bookings_requested_to_me = Booking.all.select do |booking|
      current_user.islands.include?(booking.island)
    end
    # @bookings_requested_to_me.select do |booking|
    #   current_user.islands.include?(booking.island)
    # end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path(current_user), status: :see_other
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.island = @island
    @booking.price_per_night = @island.price
    @booking.total_price = @booking.price_per_night * (@booking.end_date - @booking.start_date)
    if @booking.save!
      redirect_to island_path(@island), notice: 'Your booking was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'The booking was not created.'
    end
  end

  private

  def set_island
    @island = Island.find(params[:island_id])
  end

  def set_user
    @island.user = current_user
  end

  def booking_params
    params.require(:booking).permit(:island_id, :start_date, :end_date)
  end
end
