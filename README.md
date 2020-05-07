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

## Add Dropdown feature and Hamburger menu
1. Add `gem 'jquery-rails'`
2. Add `//= require jquery` in app\assets\javascripts\application.js after _//= require rails-ujs_
3. Add the following in application.js
```
$(document).on('turbolinks:load', function () {
    $(".dropdown-trigger").dropdown();
}) 
```

4. **Hamburger icon and responsive in mobile view**  
- Add `<a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>` in _navigation.html.erb after brand-logo class tag and Add class="sidenav" div (refer documents)
- Add **$('.sidenav').sidenav();** inside Same application.js after dropdown line
- Refer code, there we changed two dropdown id for big screen and small screen

# CRUD courses resource back-end
```
Notes:
1. A resource for our application will be courses
2. A second resource will be students
3. Therefore, for now, a Course model, think of structure of a course
4. A Student model, think of how you want to structure a student
5. Convention - courses table, Course model (class), course.rb model file
              - students table, Student model (class), student.rb model file
6. CRUD actions from back-end
7. CRUD actions (if necessary for model) from front-end
```
1. Create create_courses migration `rails g migration create_courses`
2. Make migration file as follows and run migration
```
    create_table :courses do |t|
      t.string :short_name
      t.string :name
      t.text :description
      t.timestamps
    end
```
3. Listing all the courses in courses/index view

# CRUD students resource back-end
1. Add `resources :students, except: [:destroy]` in routes.rb
2. Created students_controller.rb, student.rb, generated a migration

# Form Errors
1. Form error misalignment, add the following in config\environment.rb
```
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end
```

## Edit Student
1. Find id in students/show.html.erb `<%= link_to "Edit your profile", edit_student_path(@student) %>`


### Add icon inside button
Put the icon tag like `'<i class="material-icons right">edit</i>Edit your profile'.html_safe'`  
`<%= link_to '<i class="material-icons right">edit</i>Edit your profile'.html_safe, edit_student_path(@student), class: "waves-effect waves-light btn" %>`
