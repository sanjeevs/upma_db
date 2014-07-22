UpmaDb::Application.routes.draw do
  resources :users
  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/home', to: 'static_pages#home'
  match '/help', to: 'static_pages#help'

  resources :upanishads, only: [:index, :show]  
end
