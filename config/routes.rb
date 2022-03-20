Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  resources :users
  resources :posts
  get 'search' => 'search#index'
  put '/post/:id/like', to: 'posts#like', as: 'like'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
