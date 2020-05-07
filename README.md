### Version 5.1.6

# University Application

## pages and courses controller
Created two controllers
1. `rails g controller pages about`
2. `rails g controller courses index`

### Routes for pages and courses controller
```
get 'pages', to: 'pages#about'
get 'courses/new', to: 'courses#new'  
```
Created new.html.erb in courses view

# Install Materialize
1. Add **gem 'materialize-sass', '~> 1.0.0'** in Gemfile and bundle install
2. Create a new file as *custom_style.scss* in app\assets\stylesheets\custom_style.scss and paste **@import 'materialize';**
3. Add **//= require materialize** in app\assets\javascripts\application.js after _//= require rails-ujs_

## Install Material Icons
1. Add **gem 'material_icons'** in Gemfile for _material Icon_
2. Add **= require material_icons** in app\assets\stylesheets\application.css after _*= require_tree ._

# Styling 
1. Add Navigation by partials
2. Add footer by partials
