Rails.application.routes.draw do
  root 'coins#index', as: 'home'
  resources :coins
  resources :deals
  get 'deal' => 'deals#deal', as: 'operations'
end
