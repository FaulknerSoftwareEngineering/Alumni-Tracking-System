Rails.application.routes.draw do
  get 'welcome/index'

 root 'welcome#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers
<<<<<<< HEAD
 resources :students

=======
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
>>>>>>> 0d4f2cf6fba90a8395967755d3a60d0dca9ff3bc
end
