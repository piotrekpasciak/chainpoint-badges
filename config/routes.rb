Rails.application.routes.draw do
  root to: 'badges#new'

  resources :badges, only: [:new, :create]
end
