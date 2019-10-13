Rails.application.routes.draw do
  
  
  resources :bands do
    resources :shows
  end
  
  resources :shows
  devise_for :users

  # get '/bands/sign_up' to: 'bands#new'
 

  root to: 'application#home'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
