class CollegesController < ApplicationController
    def college_params
        params.require(:college).permit(:name)
    end
    
    def index
        @colleges = College.all
    end
    
    def new
        @college = College.new
        # default: render 'new' template
    end
    
    def create
        @college = College.create!(college_params)
        flash[:notice] = "#{@college.name} was successfully created."
        redirect_to colleges_path
    end
    
    def edit
        @college = College.find params[:id]
    end
    
    def update
        @college = College.find params[:id]
        @college.update_attributes!(college_params)
        flash[:notice] = "#{@college.name} was successfully updated."
        redirect_to colleges_path()
    end
    
    def show
        id = params[:id] 
        @college = College.find(id) 
    end
end
