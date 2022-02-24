class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    if Room.exists?(booking_id: @room.booking_id, user_id: current_user.id)
      redirect_to root_path #仮のページ遷移
    else
      @room.save
      redirect_to root_path #仮のページ遷移
    end
  end

  private

  def room_params
    params.require(:room).permit(user_ids: []).merge(booking_id: params[:booking_id], user_id: current_user.id)
  end
end
