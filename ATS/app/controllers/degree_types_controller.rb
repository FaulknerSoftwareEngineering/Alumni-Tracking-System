class DegreeTypesController < ApplicationController
=begin 
    Created by Christopher Smith & Amanda Burton
    on: April 15, 2018 
=end

  def degree_type_params
        params.require(:degree_type).permit(:name)
  end

  def index
    @degree_types = DegreeType.all
  end
    
  def show
    id = params[:id] 
    @degree_type = DegreeType.find(id) 
  end
  
  def new
    @degree_type = DegreeType.new
  end 
    
  def create
    @degree_type = DegreeType.create(degree_type_params)
    if @degree_type.save
      flash[:notice] = "#{@degree_type.name} was successfully created."
      redirect_to degree_types_path
    else
      render 'new'
    end
  end

  def edit
    @degree_type = DegreeType.find params[:id]
  end

  def update
    @degree_type = DegreeType.find params[:id]
    if @degree_type.update_attributes(degree_type_params)
      flash[:notice] = "#{@degree_type.name} was successfully updated."
      redirect_to degree_types_path(@degree_type)
    else
      render 'edit'
    end
  end

  def destroy
    @degree_type = DegreeType.find(params[:id])
    @degree_type.destroy
    flash[:notice] = "Degree Type '#{@degree_type.name}' deleted."
    redirect_to degree_types_path
  end
    
end

