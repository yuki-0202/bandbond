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
    @search_bookings = @q.result
    @my_bookings = Booking.where(user_id: current_user.id).order('updated_at DESC') if user_signed_in?
  end
end
