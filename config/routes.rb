Rails.application.routes.draw do
  root 'site#home'

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
end
