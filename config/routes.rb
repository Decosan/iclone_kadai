Rails.application.routes.draw do

  get 'toppages/index'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'signup', to: 'users#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
