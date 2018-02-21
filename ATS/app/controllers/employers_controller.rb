=begin 
  Created by:Javan Rampersad, Christopher Smith
  On: February 20, 2018
=end
class EmployersController < ApplicationController
    def employer_params
        params.require(:employer).permit(:name)
    end
    
    def index
        @employers = Employer.all
    end
    
    def new
        @employer = Employer.new
        # default: render 'new' template
    end
    
    def create
        @employer = Employer.create!(employer_params)
        flash[:notice] = "#{@employer.name} was successfully created."
        redirect_to employers_path
    end
    
    def edit
        @employer = Employer.find params[:id]
    end
    
    def update
        @employer = Employer.find params[:id]
        @employer.update_attributes!(employer_params)
        flash[:notice] = "#{@employer.name} was successfully updated."
        redirect_to employers_path()
    end
end