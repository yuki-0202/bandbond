Rails.application.routes.draw do
  devise_for :users
  root to: "bookings#index"
  resources :bookings, only: [:new, :create, :show]
end
