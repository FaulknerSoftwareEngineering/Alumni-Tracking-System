class InstitutionalResearchController < ApplicationController
	# Ian Chen 4/8/2019
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
		gon.student = Student.joins(:student_detail).joins(:student_housing).joins(:student_hour).joins(:student_veteran).joins(:attendance).joins(:athlete).joins(:standardized_test).joins(:high_school).joins(:major).joins(:student_remedial).limit(200)
		gon.student_details = @student_details
		
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