class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    if Room.exists?(booking_id: @room.booking_id, user_id: current_user.id)
      @room_id = Room.find_by(booking_id: params[:booking_id], user_id: current_user.id)
      redirect_to booking_room_path(@room.booking_id, @room_id.id)
    else
      @room.save
      @room_id = Room.find_by(booking_id: params[:booking_id], user_id: current_user.id)
      redirect_to booking_room_path(@room.booking_id, @room_id.id)
    end
  end

  def show
    @booking = Booking.find(params[:booking_id])
    @room = Room.find_by(id: params[:id])
  end

  private

  def room_params
    params.require(:room).permit(user_ids: []).merge(booking_id: params[:booking_id], user_id: current_user.id)
  end
end
