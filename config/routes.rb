Rails.application.routes.draw do
  
  resources :accounts
  
  resources :users do 
    resources :shows, only: [:index, :new, :create, :show, :destroy]
  end

  resources :bands do
    resources :shows
  end

  resources :shows
  
  get '/auth/facebook/callback', to: 'sessions#fbauth'
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"

  root to: "application#home"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
