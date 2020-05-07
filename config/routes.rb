Rails.application.routes.draw do

  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'pages', to: 'pages#about'

  resources :students, except: [:destroy]

end
