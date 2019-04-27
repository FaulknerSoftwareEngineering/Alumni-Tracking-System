# Created by Christopher Smith 03/28/18
class UniversitiesController < ApplicationController
    def university_params
        params.require(:university).permit(:name)
    end
    
    def index
        @universities = University.all
    end
    
    def new
        @university = University.new
        @student_id = params[:student_id]
        # default: render 'new' template
    end
    
    def create
        begin
            @university = University.create!(university_params)
            @student_id = params[:student_id]
            flash[:notice] = "#{@university.name} was successfully created."
            if !@student_id.nil?
            redirect_to add_grad_school_path(@student_id)
            else
            redirect_to universities_path
            end
        rescue
            render 'new'
        end
    end
    
    def edit
        @university = University.find params[:id]
    end
    
    def update
        @university = University.find params[:id]
        @university.update_attributes!(university_params)
        flash[:notice] = "#{@university.name} was successfully updated."
        redirect_to universities_path()
    end
end