Rails.application.routes.draw do
  
  resources :accounts
  resources :users do 
    resources :shows, only: [:show, :index]
  end

  resources :bands do
    resources :shows
  end

  resources :shows
  
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  delete "logout" => "sessions#logout"



  root to: "application#home"

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
