class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @bookings = Booking.all.order('updated_at DESC')
  end

  def new
    @booking = Booking.new(venue: '未定')
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @rooms = Room.where(booking_id: params[:id])
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking.id)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @booking.user_id
  end
end
