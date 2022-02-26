class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    if Room.exists?(booking_id: @room.booking_id, user_id: current_user.id)
      @room_id = Room.find_by(booking_id: params[:booking_id], user_id: current_user.id)
      redirect_to room_path(@room_id.id)
    else
      @room.save
      @room_id = Room.find_by(booking_id: params[:booking_id], user_id: current_user.id)
      redirect_to room_path(@room_id.id)
    end
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.find(@room.booking_id)
    @message = Message.new
  end

  private

  def room_params
    params.require(:room).permit(user_ids: []).merge(booking_id: params[:booking_id], user_id: current_user.id)
  end
end
