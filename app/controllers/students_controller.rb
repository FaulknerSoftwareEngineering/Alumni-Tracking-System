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
        :streetAddressOne,
        :city,
        :state,
        :zipcode)
end

def earned_degree_params
      params.require(:earned_degree).permit(
        :season,
        :year_graduated,
        :degree_id)
end



def index
    
    #@students = Student.accessible_students(session[:role_id], session[:user_id])
    @students = Student.all
    
    @earned_degrees = EarnedDegree.where(student_id: @students)
end
    
def show
  @id = params[:id] 
  @student = Student.find(@id) 
  @addresses = Address.find_by(student_id: @id)
  @earned_degrees = @student.earned_degrees.order(:year_graduated)
  
end

def new
  @student = Student.new
  @date = Date.today
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
  if @addresses.nil?
    @addresses = Address.create!(addresses_params.merge({student_id: @student.id}))
  else
  @addresses.update_attributes!(addresses_params)
  end
  
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
  
  

end