Rails.application.routes.draw do
  devise_for :users
  
  root 'groups#index'
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :entities, only: [:index]
  end

  resources :entities, only: [:new, :create, :destroy]
end