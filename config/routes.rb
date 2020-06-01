
Rails.application.routes.draw do
  #get 'institutional_research/index'

  get 'welcome/index'

 root 'index#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers
 resources :universities
 resources :roles
 resources :departments
 resources :colleges
 resources :students
 resources :institutional_research do
	collection { post :import}
 end
 resources :reports, only: [:index] do
end
 resources :degree_types
 resources :help_requests
 resources :welcome
 
 #IRB form system
 resources :forms
 resources :section1s
 resources :section2s
 resources :section3s
 resources :section3animals
 resources :section4s
 resources :section4animals
 resources :section5s
 resources :researchers
 
 match '/form/generateForm', to: 'forms#generateForm', via: [:all], as: :generate_form
 match '/form/addResearcher/:form', to: 'forms#addResearcher', via: [:all], as: :add_researcher
 match '/researcher/showFormResearchers/:form', to: 'researchers#showFormResearchers', via: [:all], as: :show_form_researchers
 #end of routes for IRB form system


# For testing college/department/degree partials
#begin
 get 'find_degree' => 'degrees#find_degree'
 
 post 'contact_support' => 'help_requests#contact_support'
 
# For links on student details page
get 'students/students/:id/grad_school' => 'students#grad_school'
get 'students/students/:id/employment' => 'students#employment'
# end group for student details page

get 'reports/generate_report' => 'reports#generate_report'
 
#earned_degree
get 'students/:id/add_degree' => 'students_details#add_earned_degree', as: :student_add_earned_degree
get 'students/:id/submit_add_degree' => 'students_details#submit_add_earned_degree', as: :submit_student_add_earned_degree 
delete  'students/:id/delete_degree' => 'students_details#delete_earned_degree', as: :delete_earned_degree
get 'students/:id/edit_earned_degree' => 'students_details#edit_earned_degree', as: :edit_earned_degree
get 'students/:id/update_earned_degree' => 'students_details#update_earned_degree', as: :update_earned_degree
#end earned degree 
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
 
 
 #Grad School
 get 'students/:id/add_grad_school' => 'students_details#add_grad_school', as: :add_grad_school
 get 'students/:id/submit_add_grad_school' => 'students_details#submit_add_grad_school', as: :submit_add_grad_school
 delete  'students/:id/delete_grad_school' => 'students_details#delete_grad_school', as: :delete_grad_school
 get 'students/:id/edit_grad_school' => 'students_details#edit_grad_school', as: :edit_grad_school
 get 'students/:id/update_grad_school' => 'students_details#update_grad_school', as: :update_grad_school
 
 #employment
 get 'students/:id/add_employment' => 'students_details#add_employment', as: :add_employment
 get 'students/:id/submit_add_employment' => 'students_details#submit_add_employment', as: :submit_add_employment
 delete  'students/:id/delete_employment' => 'students_details#delete_employment', as: :delete_employment
 get 'students/:id/edit_employment' => 'students_details#edit_employment', as: :edit_employment
 get 'students/:id/update_employment' => 'students_details#update_employment', as: :update_employment

 
end
