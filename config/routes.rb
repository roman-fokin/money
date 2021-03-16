Rails.application.routes.draw do
  root 'coins#index', as: 'home'
  resources :coins
  resources :deals
  get 'deal' => 'deals#deal', as: 'operations'

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
