# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Web Routes
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, format: :json do
          resources :comments, format: :json
        end
      end
    end
  end
end
