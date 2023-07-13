Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  resources :movies
  resources :producers
  resources :actors
  resource :categories, only: [:new ,:create, :update, :destroy]

  resources :movies do
    resources :movie_actors ,only: [:new ,:update, :destroy]
      get 'movie_actors/:actor_id', to: 'movie_actors#add' ,as: "add"
  end

  get '/cart', to: 'order_items#index'
  post 'order_item', to: 'order_items#update' ,as: "update_order"
  resources :order_item ,only: [:update, :update, :destroy]
      get 'order_item/:id', to: 'order_items#add' ,as: "add_order"


end
