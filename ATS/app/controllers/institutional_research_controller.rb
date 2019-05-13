class InstitutionalResearchController < ApplicationController
  def index
		@students = Student.all
		@earned_degrees = EarnedDegree.where(student_id: @students)
  end
	
	def import
		if params[:file].blank?
      flash[:error] = 'File cannot be empty.'
      redirect_to institutional_research_index_path
		else
			InstitutionalResearch.import(params[:file])
			redirect_to institutional_research_index_path, notice: "Students Added Successfully"
		end

		
	end
end
