Rails.application.routes.draw do
  get 'welcome/index'

 root 'welcome#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers
 resources :universities
 resources :roles
 resources :departments
 resources :colleges
 resources :students do
    resources :employers
end


# For testing college/department/degree partials
 get 'find_degree' => 'degrees#find_degree'
 
 
 
# For testing links on student details page

get 'students/:id/add_degree_student' => 'students_details#add_degree_student'
get 'students/students/grad_school' => 'students#grad_school'
get 'students/students/employment' => 'students#employment'
# end testing group for student details page
 
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
end
