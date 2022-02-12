Rails.application.routes.draw do
  devise_for :users
  get 'bookings/index'
  root to: "bookings#index"
end
