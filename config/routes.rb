Rails.application.routes.draw do
  resources :manufacturers, only: [:new, :index, :create]
end
