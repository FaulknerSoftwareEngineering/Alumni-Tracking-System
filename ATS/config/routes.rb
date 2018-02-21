Rails.application.routes.draw do
  get 'welcome/index'

 root 'welcome#index'
 
 #generate user routes
 resources :users
 resources :degrees
 resources :employers

end
