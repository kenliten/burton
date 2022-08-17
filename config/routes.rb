Rails.application.routes.draw do
  root 'site#home'

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
end
