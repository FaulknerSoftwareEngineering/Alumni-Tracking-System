class CollegesController < ApplicationController
    def college_params
        params.require(:college).permit(:name)
    end
    
    def index
        @colleges = College.all
    end
    
    def new
        @college = College.new
        @college_deans = User.where(role_id: 2)
        # default: render 'new' template
    end
    
    def create
        @college = College.create(college_params)
        @user_college = UserCollege.create(college_id: @college.id, user_id: params[:user_college][:user_id])
        if @college.save and @user_college.save
            flash[:notice] = "#{@college.name} was successfully created."
            redirect_to colleges_path
        else
            render 'new'
        end
    end
    
    def edit
        @college = College.find params[:id]
        @college_deans = User.where(role_id: 2)
        @user_college = UserCollege.find_by_college_id( @college.id)
        if @user_college
            @sel_college_dean = User.find_by(id: @user_college.user_id)
        else
            UserCollege.create(college_id: @college.id)
            @sel_college_dean = nil
        end
    end
    
    def update
        @college = College.find params[:id]
        @user_college = UserCollege.find_by_college_id(@college.id)
        @user_college.update_attributes!({user_id: params[:user_college][:user_id], college_id: @college.id}) unless @user_college.nil?
        
        if @college.update_attributes!(college_params)
            flash[:notice] = "#{@college.name} was successfully updated."
            redirect_to colleges_path()
        else
            render 'edit'
        end
    end
    
    def show
        id = params[:id] 
        @college = College.find(id) 
        @user_college = UserCollege.find_by_college_id( @college.id)
        if @user_college
            @college_dean = User.find_by_id @user_college.user_id
        end
    end
end
