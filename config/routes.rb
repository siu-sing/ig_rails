Rails.application.routes.draw do
  #   get 'follows/index'
  #   get 'follows/create'
  #   get 'follows/new'
  #   get 'follows/edit'
  #   get 'follows/show'
  get "users/index"
  get "users/new"
  get "users/edit"
  get "users/show"
  get "users/update"
  get "users/destroy"
  get "users/create"
  devise_for :users
  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/edit'
  # get 'comments/show'
  # get 'comments/update'
  # get 'comments/destroy'
  # get 'comments/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :comments

  resources :posts do
    resources :comments
  end

  resources :users do
    resources :follows
  end

  resources :posts

  root "posts#index"
end
