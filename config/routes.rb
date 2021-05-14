Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  #routes for studies
  resources :studies, only: [:index, :update, :create, :destroy]
  
  get 'studies', to: 'studies#index'
  get 'studies/:id', to: 'studies#show'
  post 'create_study', to: 'studies#create'
  patch 'update_study/:id', to: 'studies#update', as: 'update_study'
  get 'input_form', to: 'studies#new'
  
  #get 'studies/new', to: 'studies#new'
  #get '/studies', to: 'studies#index', as: 'studies'
  #get 'studies/study_group_id', to: 'studies#create'
end
