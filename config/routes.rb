Rails.application.routes.draw do
  get 'bookings/index'
  root to: "bookings#index"
end
