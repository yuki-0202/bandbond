class RoomsController < ApplicationController
  before_action :set_room_set_booking, only: [:show, :destroy]

  def create
    @room = Room.new(room_params)
    if Room.exists?(booking_id: @room.booking_id, user_id: current_user.id)
      move_to_room
    else
      @room.save
      move_to_room
    end
  end

  def show
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def destroy
    @room.destroy
    redirect_to booking_path(@booking.id)
  end

  private

  def room_params
    params.require(:room).permit(user_ids: []).merge(booking_id: params[:booking_id], user_id: current_user.id)
  end

  def set_room_set_booking
    @room = Room.find(params[:id])
    @booking = Booking.find(@room.booking_id)
  end

  def move_to_room
    room_transition = Room.find_by(booking_id: params[:booking_id], user_id: current_user.id)
    redirect_to room_path(room_transition.id)
  end
end
