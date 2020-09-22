Rails.application.routes.draw do
  get 'profile', to: "profile#index"
  devise_for :users
  root to: "cocktails#index"
  resources :cocktails do
    resources :doses, except: [:edit, :update, :destroy]
    resources :reviews, only: :create
  end
  resources :users, only: [ :show, :edit, :update, :destroy]
  resources :doses, only: [:destroy]
end
