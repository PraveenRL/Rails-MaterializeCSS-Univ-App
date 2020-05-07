### Version 5.1.6

# University Application

## pages and courses controller
Created two controllers
1. `rails g controller pages about`
2. `rails g controller courses index`

### Routes for pages and courses controller
- get 'pages', to: 'pages#about'
- get 'courses/new', to: 'courses#new'  
Created new.html.erb in courses view

