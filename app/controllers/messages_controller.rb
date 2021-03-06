class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_path(params[:room_id])
    else
      @messages = @room.messages.includes(:user)
      @booking = Booking.find(@room.booking.id)
      render 'rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
