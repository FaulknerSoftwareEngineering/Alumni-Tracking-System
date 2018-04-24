class DepartmentsController < ApplicationController
    def department_params
        params.require(:department).permit(:name, :college_id)
    end
    
    def index
        if request.xhr?
            @departments = College.find(params[:id]).departments
            render(:json => @departments)
        else
            @departments = Department.all
        end
        
    end
    
    def new
        @department = Department.new
        @department_chairs = User.where(role_id: 3)
        # default: render 'new' template
        @colleges = College.all
    end
    
    def create
        @department = Department.create(department_params)
        @department.college=(College.find(params[:college_id]))
        @user_department = UserDepartment.create(department_id: @department.id, user_id: params[:user_department][:user_id])
        if @department.save
            flash[:notice] = "#{@department.name} was successfully created."
            redirect_to departments_path
        else
            render 'new'
        end
    end
    
    def edit
        @department = Department.find params[:id]
        @department_chairs = User.where(role_id: 3)
        @user_department = UserDepartment.find_by_department_id( @department.id)
        if @user_department
            @sel_dept_chair =  User.find_by(id: @user_department.user_id)
        else
            UserDepartment.create(department_id: @department.id)
            @sel_dept_chair = nil
        end
        @colleges = College.all
        @default_college = @department.college_id.to_s
    end
    
    def update
        @department = Department.find params[:id]
        @department.college=(College.find(params[:college_id]))
        @user_department = UserDepartment.find_by_department_id( @department.id)
        @user_id = params[:user_department][:user_id] unless params[:user_department].nil?
        @user_department.update_attributes!({user_id: @user_id, department_id: @department.id}) unless @user_department.nil?
        if @department.update_attributes!(department_params) 
            flash[:notice] = "#{@department.name} was successfully updated."
            redirect_to departments_path(@department)
        else
            render 'edit'
        end
    end
    
    def show
        id = params[:id] 
        @department = Department.find(id)
        @user_department = UserDepartment.find_by_department_id( @department.id)
        if @user_department
            @dept_chair = User.find_by_id @user_department.user_id
        end
        if !@department.college_id.nil?
            @college = College.find(@department.college_id).name
        end
    end
end
