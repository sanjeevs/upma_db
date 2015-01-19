UpmaDb::Application.routes.draw do
  resources :users
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :verses, only: [:edit, :update, :destroy, :new, :create, :show, :index]
  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/home', to: 'static_pages#home'
  match '/help', to: 'static_pages#help'

  resources :upanishads, only: [:index, :show]  
end
