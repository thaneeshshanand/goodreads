Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :authors, only: [:index, :create, :show, :edit, :update, :destroy]
end