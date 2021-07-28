Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'profiles/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  resources :profiles do
    resources :hangouts, only: [:new, :create]
  end

  get '/components', to: 'pages#components', as: :components

  resources :hangouts, only: [:show, :destroy, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end
end
