require 'mailgun'

class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index, :contact_support]
  # Ethan Widen 2/20/18
  def index
    
  end
  
  
end
