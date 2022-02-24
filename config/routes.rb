Rails.application.routes.draw do
  devise_for :users
  root to: "bookings#index"
  resources :bookings do
    resources :rooms, only: [:create]
  end
end
