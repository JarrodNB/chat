Rails.application.routes.draw do
  
  devise_for :users, skip: :all
  resources :messages, :only => [:index, :create]
  resources :users, :only => [:create, :show]
  resources :sessions, :only => [:create, :destroy]
  
end
