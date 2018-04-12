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

def employment_params
      params.require(:employment).permit(
        :job_title,
        :start_date,
        :current_job,
        :in_field)
end

def grad_schools_params
      params.require(:grad_schools).permit(
        :applied,
        :accepted,
        :status,
        :higher_degree_type,
        :higher_degree_name)
end

def index
    
    @students = Student.students_in_department(session[:role_id])
end
    
def show
  @id = params[:id] 
  @student = Student.find(@id) 
  @addresses = Address.find_by(student_id: @id)
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
    @id = params[:id]
    @student = Student.find(@id)  
    @grad_degrees = @student.grad_schools
    render :partial => 'graduate_degree_table'
  end
  
  def employment
    @id = params[:id]
    @student = Student.find(@id)
    @employment = @student.employments
    render :partial => 'employment_student_table'
  end
  
  def add_grad_school
    @universities = University.all
    @id = params[:id]
    @name = Student.find(@id).first_name + " " + Student.find(@id).last_name
  end
    
  def submit_add_grad_school
    @id = params[:id]
    @grad_schools = GradSchool.create!(grad_schools_params.merge({student_id: @id}))
    redirect_to student_path(@id)
  end
  
  def add_employer
    @employers = Employer.all
    @id = params[:id]
    @name = Student.find(@id).first_name + " " + Student.find(@id).last_name
  end
  
  def submit_add_employer
    @id = params[:id]
    @student = Student.find(@id) 
    @employment = Employment.create!(employment_params.merge({student_id: @id}))
    redirect_to student_path(@student)
  end

end