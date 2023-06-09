Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/about", to: "pages#about"
  # Profile page
  get "/profile", to: "profiles#my_page", as: "my_profile"

  resources :offers do
    member do
      patch 'reject'
      patch 'accept'
    end
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
  end
  resources :bookings, only: [:index, :show, :destroy]
  resources :profiles, only: [:show, :edit, :update]
end
