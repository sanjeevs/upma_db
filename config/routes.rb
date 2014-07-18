UpmaDb::Application.routes.draw do
  resources :upanishads, only: [:index, :show]  
end
