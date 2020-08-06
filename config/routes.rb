Rails.application.routes.draw do
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

  resources :users
  resources :posts

  root "posts#index"
end
