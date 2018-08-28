Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :bookings
    resources :hostels, only: [:index, :show]
    resources :services, only: [:index, :show]



  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

