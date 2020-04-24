class InstitutionalResearchController < ApplicationController
  def index
		@students = Student.all
		@student_remedials = StudentRemedial.all
		@student_housings = StudentHousing.all
		@student_tuitions = StudentTuition.all
		@student_veterans = StudentVeteran.all
		@student_hours = StudentHour.all
		@attendances = Attendance.all
		@athletes = Athlete.all
		@standardized_tests = StandardizedTest.all
		@student_details = StudentDetail.all
		@high_schools = HighSchool.all
		@majors = Major.all
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
