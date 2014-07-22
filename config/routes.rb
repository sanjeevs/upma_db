UpmaDb::Application.routes.draw do
  get "users/new"

  root to: 'static_pages#home'
  match '/home', to: 'static_pages#home'
  match '/help', to: 'static_pages#help'

  resources :upanishads, only: [:index, :show]  
end
