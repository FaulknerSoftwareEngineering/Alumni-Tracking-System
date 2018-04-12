=begin
class StudentsDetailsController < ApplicationController
   
   
    def earned_degree_params
      params.require(:earned_degree).permit(
        :season,
        :year_graduated,
        :degree_id)
    end
   
    def submit_add_degree_student
        id = params[:id] 
        @student = Student.find(id) 
        EarnedDegree.create!(earned_degree_params.merge({student_id: @student.id}))
        redirect_to students_path(@student)
    end
    
    
end
=end