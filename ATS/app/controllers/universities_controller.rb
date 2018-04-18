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
        # default: render 'new' template
    end
    
    def create
        begin
            @university = University.create!(university_params)
            flash[:notice] = "#{@university.name} was successfully created."
            redirect_to universities_path
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