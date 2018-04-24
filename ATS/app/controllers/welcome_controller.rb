class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index, :contact_support]
  # Ethan Widen 2/20/18
  def index
    
  end
  
  def contact_support
    @contact_support = ContactSupport.new(email: params[:email], message: params[:message])
    if @contact_support.save
      @status = 'success'
    else
      @status = 'error'
    end
  end
end
