class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :set_header

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :sex_id, :genre_id, :area_id, :part_id, :introduction])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def set_header
    @q = Booking.ransack(params[:q])
    @search_bookings = @q.result.order('updated_at DESC')

    # 投稿履歴
    @my_bookings = Booking.where(user_id: current_user.id).order('updated_at DESC') if user_signed_in?

    # チャット履歴
    if user_signed_in?
      my_message_rooms = []
      my_bookig_rooms = Room.where(user_id: current_user.id)
      my_bookig_rooms.each do |room|
        my_message_rooms << room if room.messages.present?
      end
      @my_bookings.each do |booking|
        booking.rooms.each do |room|
          my_message_rooms << room if room.messages.present?
        end
      end
      @my_rooms = my_message_rooms.sort_by{|x| x.messages.last.created_at}.reverse
    end
  end
end
