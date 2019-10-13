Rails.application.routes.draw do
  
  resources :users 
  resources :bands do
    resources :shows
  end

  resources :shows

  # get '/bands/sign_up' to: 'bands#new'
 
  root to: 'application#home'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
