=begin 
  Created by:Javan Rampersad, Christopher Smith
  On: February 20, 2018
=end
class EmployersController < ApplicationController

    def employer_params
        params.require(:employer).permit(
            :name,
            :number,
            :email,
            :contact_name)
    end
    
    def index
        @employers = Employer.all
    end
    
    def new
        @employer = Employer.new
        @student_id = params[:student_id]
        # default: render 'new' template
    end
    
    def create
        @employer = Employer.create(employer_params)
        @student_id = params[:student_id]
        if @employer.update_attributes(employer_params)
            flash[:notice] = "#{@employer.name} was successfully created."
            if !@student_id.nil?
            redirect_to add_employment_path(@student_id)
            else
            redirect_to employers_path
            end
        else
            render 'new'
        end
    end
    
    def edit
        @employer = Employer.find params[:id]
    end
    
    def update
        @employer = Employer.find params[:id]
        if @employer.update_attributes(employer_params)
            #@employer.update_attributes!(employer_params)
            flash[:notice] = "#{@employer.name} was successfully updated."
            redirect_to employers_path()
        else
            render 'edit'
        end
    end
end