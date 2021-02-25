Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations"
  }
  devise_for :users, path: "", controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations", 
  }
  # devise_for :users, controllers: {
  #   registrations: "users/registrations"
  # }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "/about", to: "homes#about"
  get "/access", to: "homes#access"
  resources :studios, only: [:index, :show]
  # get "/studios", to: "studios#index"
  # get "/studios/"
  resource :contact, only: [:new, :create]
  # get "/contact", to: "contacts#new"
  # post "/contact", to: "contacts#create"
  
  scope module: :users do
    resource :user, only: [:show]
    resources :reservations
  end

  
  namespace :admins do
    resources :contacts, only: [:index, :show, :update]
    resources :reservations, except: [:new, :create, :destroy]
    resources :users, except: [:new, :create, :destroy]
    resources :studios, except: [:new, :create, :destroy] do
      resources :equipments, only: [:create, :destroy]
    end
    resources :paid_equipments
    resources :equipment_genres, only: [:index]
    resources :closes, only: [:index, :create, :destroy]
  end
  get "/admins", to: "admins/homes#top"
  
end
