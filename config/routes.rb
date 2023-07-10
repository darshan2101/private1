require 'sidekiq/web'
Rails.application.routes.draw do
  resources :chatrooms
  resources :expertises
  # get 'welcome/home'
  resources :projects
  resources :roles
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  scope '/admin' do
    resources :users do
      get 'download' ,to:"users/download"
    end
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'welcome#home'
end
   