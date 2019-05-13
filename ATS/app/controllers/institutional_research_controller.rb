class InstitutionalResearchController < ApplicationController
  def index
		@students = Student.all
		@earned_degrees = EarnedDegree.where(student_id: @students)
  end
	
	def import
		InstitutionalResearch.import(params[:file])
		redirect_to institutional_research_index_path, notice: "Students Added Successfully"
	end
end
