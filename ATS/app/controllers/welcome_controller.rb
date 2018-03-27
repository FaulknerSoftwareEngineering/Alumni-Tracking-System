class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  # Ethan Widen 2/20/18
  def index
    
  end
end
