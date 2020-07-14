Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show, :edit, :update, :index] do
  	member do
      get :follows, :followers
    end
  end
  resources :baseballs do
    resource :favorites, only: [:create, :destroy]
    resources :baseball_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
