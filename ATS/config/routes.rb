=begin 
  Created by:Javan Rampersad, Christopher Smith
  On: February 20, 2018
=end
Rails.application.routes.draw do
  resources :employers
  root :to => redirect('/employers')
end
