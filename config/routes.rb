Rails.application.routes.draw do
  # Skip all prevents devise from rendering html for user resource
  devise_for :users, skip: :all
  resources :messages, :only => [:index, :create]
  resources :users, :only => [:create, :show]
  resources :sessions, :only => [:create]
  post '/sessions/destroy', to: 'sessions#destroy'
  
end
