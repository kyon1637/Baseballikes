Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show, :edit, :update, :index] do
      get :favorites, on: :member
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
  get "search" => "users#search"
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
