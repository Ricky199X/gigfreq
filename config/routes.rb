Rails.application.routes.draw do
  
  resources :accounts
  resources :users
  resources :bands do
    resources :shows
  end
  resources :shows

  root to: 'application#home'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
