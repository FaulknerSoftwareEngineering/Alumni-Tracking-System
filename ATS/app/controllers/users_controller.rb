class UsersController < ApplicationController
    #Ethan Widen 2/20/18
    
    def user_params
        params.require(:user).permit(
            :provider,
            :uid,
            :email,
            :name,
            :first_name,
            :last_name,
            :user_image,
            :oauth_token,
            :oauth_expires_at,
            :google_id,
            :role
            )
    end

    def index
        @users = User.all
    end
    
    def new
        @roles = Role.all
        @user = User.new
    end
    
    def create
        @role = Role.find_by_id(params[:role][:id])
        @user = User.create!(user_params)
        @user.role = @role
        flash[:success] = "#{@user.name} as successfully created."
        redirect_to users_path
    end
    
    def edit
        @user = User.find params[:id]
        @role = Role.find_by_id(@user.role_id)
    end
    
    def update
        @user = User.find params[:id]
        @role = Role.find_by_id(params[:role][:id])
        @user.update_attributes!(user_params)
        @user.role_id = @role.id
        @user.save!
        flash[:success] = "#{@user.name} was successfully updated."
        redirect_to users_path
    end
    
end
