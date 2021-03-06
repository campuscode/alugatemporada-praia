Rails.application.routes.draw do

  devise_for :users
  devise_for :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  #get '/price_range/new', to: 'price_range#new', as:'new_price_range'
  resources :properties do
    resources :proposals do
      post 'reject'
    end
    resources :price_ranges, only: [:new, :create]
    resources :unavailable_ranges, only: [:new, :create]
    get 'search', on: :collection
    get 'my_properties', on: :collection
    get 'my_proposals', on: :collection
  end

  resources :price_ranges, only: [:show]

  resources :profiles, only: [:show] do
    get 'send_photo'
    patch 'save_photo'
  end
end
