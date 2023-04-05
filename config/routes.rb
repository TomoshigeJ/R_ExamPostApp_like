Rails.application.routes.draw do
  root :to => 'posts#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :posts
  resources :users, only: %i[new create]
  resources :likes, only: %i[create destroy]
end
