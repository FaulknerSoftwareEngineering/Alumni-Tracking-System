class RolesController < ApplicationController
    #Ethan Widen 3/28/18
    
    def role_params
        params.require(:role).permit(
            :name
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
end
