class DepartmentsController < ApplicationController
    def department_params
        params.require(:department).permit(:name, :dept_chair, :college_id)
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
        # default: render 'new' template
        @colleges = College.all
    end
    
    def create
        @department = Department.create(department_params)
        @department.college=(College.find(params[:college_id]))
        if @department.save
            flash[:notice] = "#{@department.name} was successfully created."
            redirect_to departments_path
        else
            render 'new'
        end
    end
    
    def edit
        @department = Department.find params[:id]
        @colleges = College.all
    end
    
    def update
        @department = Department.find params[:id]
        @department.college=(College.find(params[:college_id]))
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
    @college = College.find(@department.college_id).name
    end
end
