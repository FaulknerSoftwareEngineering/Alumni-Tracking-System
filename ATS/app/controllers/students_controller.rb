class StudentsController < ApplicationController
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

def student_params
        params.require(:student).permit(:first_name,:last_name,:date_of_birth)
end

def index
    @students = Student.all
end
    
def show
  id = params[:id] 
  @student = Student.find(id) 
  
end

def new
  @student = Student.new
end 
    
def create
    @student = Student.create!(student_params)
    flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully created."
    redirect_to students_path
  end

  def edit
    @student = Student.find params[:id]
  end

  def update
  @student = Student.find params[:id]
  @student.update_attributes!(student_params)
    flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully updated."
    redirect_to students_path(@student)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' deleted."
    redirect_to students_path
  end
    
end
