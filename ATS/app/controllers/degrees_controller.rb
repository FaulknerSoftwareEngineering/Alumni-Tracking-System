class DegreesController < ApplicationController
=begin 
    Created by Zack Pace & Amanda Burton
    on: Feburary 20, 2018 
=end

  def degree_params
        params.require(:degree).permit(:name, :degree_type, :department_id, :degree_type_id)
  end

  def find_degree
    @colleges = College.all
    @departments = Department.all
    @degrees = Degree.all
  end

  def index
    if request.xhr?
        @degrees = Department.find(params[:id]).degrees
        render(:json => @degrees)
    else
        @degrees = Degree.all
    end
  end
    
  def show
    id = params[:id] 
    @degree = Degree.find(id) 
    @department = @degree.department.name
    @degree_type = @degree.degree_type
  end
  
  def new
    @degree = Degree.new
    @departments = Department.all
    @degree_types = DegreeType.all
    
  end 
    
  def create
    begin
      @degree = Degree.create(degree_params)
      @degree.department=(Department.find(params[:department_id]))
      if @degree.save
        flash[:notice] = "#{@degree.name} was successfully created."
        redirect_to degrees_path
      end
    rescue StandardError => e
      render 'new'
    end
  end

  def edit
    @degree = Degree.find params[:id]
    @departments = Department.all
    @degree_types = DegreeType.all
  end

  def update
    @degree = Degree.find params[:id]
    @degree.department=(Department.find(params[:department_id]))
    if @degree.update_attributes(degree_params)
      flash[:notice] = "#{@degree.name} was successfully updated."
      redirect_to degrees_path(@degree)
    else
      render 'edit'
    end
  end

  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy
    flash[:notice] = "Degree '#{@degree.name}' deleted."
    redirect_to degrees_path
  end
    
end
