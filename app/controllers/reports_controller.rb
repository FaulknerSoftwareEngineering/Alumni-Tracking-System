class ReportsController < ApplicationController
def earned_degree_params
      params.require(:earned_degree).permit(
        :year_graduated)
end
def university_params
      params.require(:grad_schools).permit(
        :university_id)
end
    def index
    
    end
    
    def generate_report
        @students = Student.accessible_students(session[:role_id], session[:user_id])
        @earned_degree = EarnedDegree.where(student_id: @students).where(earned_degree_params)
        
    end
    
end