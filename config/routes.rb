Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
      get 'search_index'
      get 'search_result'
    end
  end
  
  resources :cards, only: [:new, :create]
  
end
