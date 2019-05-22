require 'mailgun'

class WelcomeController < ApplicationController
  # Ethan Widen 2/20/18
  def index
    @role = Role.find_by_id(session[:role_id])
    if !@role.nil?
      if @role.name == "VPAA" or @role.name == "System Admin"
        @admin_visible = true
      else
        @admin_visible = false
      end
    end
  end
  
  
end
