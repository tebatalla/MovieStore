Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :movies, only: [:index, :show]
  resources :users, only: [:show]
  root to: 'movies#index'
  post 'buy', to: 'api/purchase_options#buy', as: 'buy'
end
