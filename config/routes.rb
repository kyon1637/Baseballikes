# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show edit update index] do
    get :favorites, on: :member
    member do
      get :follows, :followers
    end
  end
  resources :baseballs do
    resource :favorites, only: %i[create destroy]
    resources :baseball_comments, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
  root 'homes#top'
  get 'homes/about'
  get 'search' => 'users#search'
  resources :messages, only: [:create]
  resources :rooms, only: %i[create show index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
