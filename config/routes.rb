Rails.application.routes.draw do
  resources :manufacturers, only: [:new, :index, :create]

  resources :cars, only: [:new, :index, :create]

  root 'homes#index'
end
