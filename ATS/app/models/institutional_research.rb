class InstitutionalResearch < ActiveRecord::Base
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Student.create!({
				:first_name => row[1],
				:middle_name => row[2],
				:last_name => row[3],
				:primary_email => row[59],
			})
		end
	end
end