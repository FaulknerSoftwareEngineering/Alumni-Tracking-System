class DegreesController < ApplicationController
=begin 
    Created by Zack Pace & Amanda Burton
    on: Feburary 20, 2018 
=end
  def index
    @degrees = Degree.all
  end
    
  def show
    id = params[:id] 
    @degree = Degree.find(id) 
    
  end

  def new
    @degree = Degree.new
    
    # @student = Student.find(params[:student_id])
    
    # @degree ||= @student.degree.new
  end 
      
  def create
    params.require(:degree)
    permitted = params[:degree].permit(:name)
    @degree = Degree.create!(permitted)
    flash[:notice] = "#{@degree.name} was successfully created."
    redirect_to degrees_path
    
    # @student = Student.find(params[:student_id])
    
    # @degree = @student.degree.build(params[:degree])
    
    # if @degree.save
    #   flash[:notice] = 'Degree successfully created.'
    #   redirect_to(student_degrees_path(@student))
    # else
    #   render :action => 'new'
    # end
  end

  def edit
    @degree = Degree.find params[:id]
  end

  def update
   permitted = params[:degree].permit(:name)
    @degree = Degree.find params[:id]
    @degree.update_attributes!(permitted)
    flash[:notice] = "#{@degree.name} was successfully updated."
    redirect_to degrees_path(@degree)
  end

  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy
    flash[:notice] = "Degree '#{@degree.name}' deleted."
    redirect_to degrees_path
  end
    
end
