Rails.application.routes.draw do
  devise_for :users
  root to: "bookings#index"
  resources :bookings, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :rooms, only: [:new, :create]
end
