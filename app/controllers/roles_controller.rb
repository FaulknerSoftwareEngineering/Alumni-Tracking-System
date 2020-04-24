class RolesController < ApplicationController
    #Ethan Widen 3/28/18
    
    def role_params
        params.require(:role).permit(
            :name,
            :colleges_visible,
            :departments_visible
        )
    end
    
    def index
        @roles = Role.all
    end
    
    def new
        @role = Role.new
    end
    
    def create
        @role = Role.create!(role_params)
        flash[:success] = "#{@role.name} as successfully created."
        redirect_to roles_path
    end
    
    def edit
        @role = Role.find_by_id params[:id]
    end
    
    def show
        @role = Role.find_by_id params[:id]
    end
    
    def update
        @role = Role.find_by_id params[:id]
        @role.update_attributes!(role_params)
        redirect_to roles_path
    end
end
