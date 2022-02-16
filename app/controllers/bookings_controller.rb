class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def booking_params
    params.require(:booking).permit(
      :area_id,
      :genre_id,
      :date_start,
      :date_end,
      :venue,
      :detail
    ).merge(user_id: current_user.id)
  end
end
