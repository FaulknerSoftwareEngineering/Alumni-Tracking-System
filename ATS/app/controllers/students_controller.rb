class StudentsController < ApplicationController

=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

def student_params
        params.require(:student).permit(
        :first_name,
        :middle_name,
        :last_name,
        :primary_email,
        :secondary_email,
        :cell_number,
        :work_number,
        :home_number)
end

def addresses_params
      params.require(:addresses).permit(
        :street_address,
        :city,
        :state,
        :zip)
end

def earned_degree_params
      params.require(:earned_degree).permit(
        :season,
        :year_graduated,
        :degree_id)
end

def index
    
    @students = Student.students_in_department(session[:role_id])
end
    
def show
  id = params[:id] 
  @student = Student.find(id) 
  @addresses = Address.find_by(student_id: id)
  @earned_degrees = @student.earned_degrees
  
end

def new
  @student = Student.new
end 
    
def create
    @student = Student.create!(student_params)
    @addresses = Address.create!(addresses_params.merge({student_id: @student.id}))
    @earned_degree = EarnedDegree.create!(earned_degree_params.merge({student_id: @student.id}))
    flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully created."
    redirect_to students_path
end

  def edit
    id = params[:id] 
    @student = Student.find(id) 
    @addresses = Address.find_by(student_id: id)
  end

  def update
  id = params[:id] 
  @student = Student.find(id) 
  @addresses = Address.find_by(student_id: id)
  @student.update_attributes!(student_params)
  @addresses.update_attributes!(addresses_params)
  flash[:notice] = "#{@student.first_name} #{@student.last_name} was successfully updated."
  redirect_to students_path(@student)
  end

  def destroy
    id = params[:id] 
    @student = Student.find(id) 
    @addresses = Address.find_by(student_id: id)
    @student.destroy
    @addresses.destroy
    EarnedDegree.where(student_id: id).destroy_all
    flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' deleted."
    redirect_to students_path
  end
  
  def grad_school
    @grad_degrees = Student.all
    render :partial => 'graduate_degree_table'
  end
  
  def employment
    @employment = Student.all
    render :partial => 'employment_student_table'
  end
  
    

end
