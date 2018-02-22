class UsersController < ApplicationController
    #Ethan Widen 2/20/18
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :google_id)
    end

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create!(user_params)
        flash[:success] = "#{@user.first_name} #{@user.last_name} was successfully created."
        redirect_to users_path
    end
    
    def edit
        @user = User.find params[:id]
    end
    
    def update
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:success] = "#{@user.first_name} #{@user.last_name} was successfully updated."
        redirect_to users_path
    end
    
end
