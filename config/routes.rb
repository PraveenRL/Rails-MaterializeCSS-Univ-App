Rails.application.routes.draw do

  get 'courses/new', to: 'courses#new'

  get 'pages', to: 'pages#about'

end
