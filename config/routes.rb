# frozen_string_literal: true

Rails.application.routes.draw do
  get 'conversations/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :conversations do
    resources :messages
  end

  resources :reservations do
    member do
      put 'reject_status'
    end
  end
  resources :tables
  resources :restaurants do
    resources :reviews, only: %i[new create edit update destroy]
    resources :reservations, only: %i[new create edit update destroy]
    resources :tables, only: %i[new create edit update destroy]
  end
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/about'
  get 'welcome/index'
  get 'welcome/termsofuse'
  root to: 'welcome#index'
end
