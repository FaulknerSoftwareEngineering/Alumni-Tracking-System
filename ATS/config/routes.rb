Rails.application.routes.draw do
  #get 'welcome/index'

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
    resources :earned_degrees
end


# For testing college/department/degree partials
#begin
 get 'find_degree' => 'degrees#find_degree'
 
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
 
 get 'students/:id/add_grad_school' => 'students#add_grad_school', as: :add_grad_school
 get 'students/:id/submit_add_grad_school' => 'students#submit_add_grad_school', as: :submit_add_grad_school
 
 get 'students/:id/add_employer' => 'students#add_employer', as: :add_employer
 get 'students/:id/submit_add_employer' => 'students#submit_add_employer', as: :submit_add_employer
end
#end