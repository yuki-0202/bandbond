Rails.application.routes.draw do
  devise_for :users
  root to: "bookings#index"
  resources :users, only: [:edit, :update,] do
    collection do
      get 'purge'
    end
  end
  resources :bookings do
    resources :rooms, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:show, :destroy] do
    resources :messages, only: [:create]
  end
end
