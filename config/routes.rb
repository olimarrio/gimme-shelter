Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :hostels, only: [:index, :show] do
    resources :bookings do
       resources :payments, only: [:new, :create]
      end
  end
  resources :services, only: [:index, :show]

  resources :users, only: [:show, :edit]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

