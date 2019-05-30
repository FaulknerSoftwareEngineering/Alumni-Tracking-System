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
		# pass datas from server to client by using gon gem
		gon.ugbyClassAndGen = InstitutionalResearch.undergraduatebyclassificationAndGender
		gon.gabyClassAndGen = InstitutionalResearch.graduatebyclassificationAndGender
		gon.galbyClassAndGen = InstitutionalResearch.udlbyClassificationandGender
		gon.ualbyCollege = InstitutionalResearch.ualbyCollege
		gon.studentEnrollment = InstitutionalResearch.studentEnrollment
	end

	def delete
		@importHistory = params[:post][:id].to_s
		Student.all.each do |x|
			@date = x.created_at.to_s[0,10]
			if @date == @importHistory
				x.destroy
			end
		end

		respond_to do |format|
			format.html { redirect_to institutional_research_index_path, notice: "Imported Record was deleted" }
			format.json { head :no_content }
		end
  end

end