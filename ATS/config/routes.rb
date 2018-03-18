Rails.application.routes.draw do
  get 'welcome/index'

 root 'welcome#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers
 
 get 'auth/:provider/callback' => 'sessions#create'
 get 'logout' => 'sessions#destroy'
 get 'auth/failure' => 'sessions#failure'
 get 'auth/google_oauth2', :as => 'login'
end
