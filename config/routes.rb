Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, except: [:edit, :update] do
    resources :doses, except: [:edit, :update, :destroy]
    resources :reviews, only: :create
  end
  resources:doses, only: [:destroy]
end
