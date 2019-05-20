class InstituationalResearchController < ApplicationController
	# Ian Chen 4/8/2019
	def index
		@students = Student.all
		@student_details = StudentDetail.all
		@degrees = Degree.all
	end

	def user
		@user = User.all
	end

	def degree_by_gender
		render json: Student.group(:gender).joins(:degrees).group(:degree_type_id).count.chart_json
	end
end