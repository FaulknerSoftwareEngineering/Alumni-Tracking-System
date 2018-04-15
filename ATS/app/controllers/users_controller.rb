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
            :role,
            :colleges,
            :departments
            )
    end

    def index
        @users = User.all
    end
    
    def new
        @roles = Role.all
        @user = User.new
        @departments = Department.all
        @colleges = College.all
    end
    
    def create
        @departments = Department.where(id: params[:departments][:ids])
        @colleges = College.where(id: params[:colleges][:ids])
        @role = Role.find_by_id(params[:role][:id])
        @user = User.create!(user_params)
        @user.role_id = @role.id
        @user.colleges = @colleges
        @user.departments = @departments
        @user.save!
        flash[:success] = "#{@user.name} was successfully created."
        redirect_to users_path
    end
    
    def edit
        @departments = Department.all
        @colleges = College.all
        @user = User.find params[:id]
        @role = Role.find_by_id(@user.role_id)
        @sel_departments = @user.departments
        @sel_colleges = @user.colleges
    end
    
    def update
        @departments = Department.where(id: params[:departments][:ids])
        @colleges = College.where(id: params[:colleges][:ids])
        @user = User.find params[:id]
        @role = Role.find_by_id(params[:role][:id])
        @user.update_attributes!(user_params)
        @user.role_id = @role.id
        @user.colleges = @colleges
        @user.departments = @departments
        @user.save!
        flash[:success] = "#{@user.name} was successfully updated."
        redirect_to users_path
    end
    
end
