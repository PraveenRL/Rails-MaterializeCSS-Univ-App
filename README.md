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

# DRY - Don't Repeat Yourself

### 1. Students Controller
- Create a private method
```
def set_student
        @student = Student.find(params[:id])
end
```
- and put `before_action :set_student, only: [:show, :edit, :update]` about all methods.

### 2. Students Views (_form partial)
- Create _form.html.erb under students view folder
- Cut everything from new.html.erb and edit.html.erb and paste in _form.html.erb
- Write `<%= render 'form' %>` in new.html.erb and edit.html.erb
- **Change in _form.html.erb**
- `<h3 class="header"><%= @student.new_record? ? "Sign Up" : "Edit Profile" %></h3>`
- `<%= f.submit(@student.new_record? ? "Sign Up" : "Submit Update", class: "btn orange waves-effect waves-light") %>`

### 3. Errors Partials
- Create folder as shared and create `_error.html.erb` inside it.
- Cut the errors code from _form.html.erb and paste in _error.html.erb
- Modify the first line as `obj.errors.any?`
- Pass object to error partial eg: `<%= render 'shared/error', obj: @student %>`

# Add password
- `rails g migration add_password_digest_to_students` 
- Make as **add_column :students, :password_digest, :string** inside change
- Run migration
- **Update all in rails console**
```
Student.all.each do |student|
student.password = "password"
student.save
end
```

# Authentication System Session
<div>
<h5>Login Logout functionality - Authentication system</h5>
<ol>
    <li>Build routes - these are custom routes we will build for login and logout.</li>
    <li>Build login form, but won't be model backed form since there is no 'model' for logging in or out, we are simply simulating it</li>
    <li>We will use :student_id of the student to identify them and start sessions</li>
    <li>Some functions we will need to form
        <ul>
            <li>retreive current user based on if someone is logged in</li>
            <li>check if a user is currently logged in</li>
            <li>require a logged in user to perform actions</li>
            <li>make some of our methods available to views and controllers</li>
        </ul>
    </li>
</ol>

### flash.now[] -> Only on current page, not on next route

## Helper used in views
**ApplicationHelper =>**
```
def session_link
    if (logged_in?)
        link_to("Logout", logout_path, method: :delete)
    else
        link_to("Login", login_path)
    end
end
```
**_navigation.html.erb =>**
`<li><%= session_link %></li>`

## Restrict actions
- `require_user` method in application_controller.rb
- In sessions_controller.rb paste `skip_before_action :require_user, only: [:new, :create]` - This will skip the authenticate restrict actions
- `before_action :require_same_student, only: [:edit, :update]` and define require_same_student in students_controller.rb

<div>
<h1>Many-To-Many association</h1>
</h3>students and courses</h3>
<ul>
    <li>Course model and Student model, we will work with primary key for both and use them as foreign key</li>
    <li>student_courses_controller.rb</li>
    <li>student_course.rb model file</li>
    <li>student_courses table</li>
</ul>

- Rails console > **rails g migration create_student_courses** -> create **student_courses** table after migration
- Create student_course.rb
- Add the following in student.rb
```
has_many :student_courses
has_many :courses, through: :student_courses
```
- Add the following in courses.rb
```
has_many :student_courses
has_many :students, through: :student_courses
```
- Add the following in student_course.rb
```
belongs_to :student
belongs_to :course
```
</div>

## Iterate 
> course.students.each { |student| puts student.name }

