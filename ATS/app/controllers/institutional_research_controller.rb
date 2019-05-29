class InstitutionalResearchController < ApplicationController
	# Ian Chen 4/8/2019
	def index
		gon.student_details = InstitutionalResearch.StudentDetail
		@import_history = InstitutionalResearch.dateOfCreated
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

	def show
		gon.ugbyClassAndGen = InstitutionalResearch.undergraduatebyclassificationAndGender
		gon.gabyClassAndGen = InstitutionalResearch.graduatebyclassificationAndGender
		gon.galbyClassAndGen = InstitutionalResearch.udlbyClassificationandGender
		gon.ualbyCollege = InstitutionalResearch.ualbyCollege
		gon.studentEnrollment = InstitutionalResearch.studentEnrollment
	end

end