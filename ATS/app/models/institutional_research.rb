class InstitutionalResearch < ActiveRecord::Base
	# Ian Chen 5/15/2019
	def self.import(file)

		CSV.foreach(file.path, headers: true) do |row|

			Student.create!({
				:first_name => row[1],
				:middle_name => row[2],
				:last_name => row[3],
				:primary_email => row[59],
				:student_id => row[0]
			})

			StudentRemedial.create!({
				:remedial0301 => row[122],
				:remedial0302 => row[123],
				:remedial0305 => row[124],
				:remedial1335 => row[125],
				:remedial1300 => row[126],
				:student_id => row[0]
			})
					 		 
			StudentHousing.create!({
				:campus => row[13],
				:housingType => row[115],
				:housingID => row[116],
				:roomNumber => row[117],
				:mealPlan => row[118],
				:student_id => row[0],
			})

			StudentTuition.create!({
				:tuitionAssistance => row[63],
				:source => row[64],
				:student_id => row[0],
			}) 



			StudentVeteran.create!({
				:veteran => row[60],
				:chapter => row[61],
				:percent => row[62],
				:student_id => row[0],
			})



			StudentHour.create!({
				:program => row[14],
				:jslHoursAttempted => row[97],
				:jslHoursCompleted => row[98],
				:jslQualityHours => row[99],
				:jslQualityPoints => row[100],
				:doctorateMajor => row[58],
				:gradHoursAttempted => row[93],
				:gradHoursCompleted => row[94],
				:gradQualityHours => row[95],
				:gradQualityPoints => row[96],
				:transient => row[24],
				:transfer => row[25],
				:undergradTransferQualityHours => row[26],
				:undergradTransferQualityPoints => row[27],
				:undergradSemesterHoursAttempted => row[29],
				:undergradSemesterHoursCompleted => row[30],
				:undergradQualityHours => row[31],
				:undergradQualityPoints => row[32],
				:currentHours => row[33],
				:student_id => row[0],
			})



			Attendance.create!({
				:current => row[33],
				:effective => row[84],
				:firstYear => row[85],
				:firstTermUndergrad => row[86],
				:attendanceUndergrad => row[87],
				:termOfficalUndergrad => row[88],
				:firstTermGraduate => row[89],
				:attendanceGraduate => row[90],
				:termOfficialGraduate => row[91],
				:student_id => row[0],
			})

			Athlete.create!({
				:baseball => row[16],
				:basketball => row[17],
				:cheerleader => row[18],
				:football => row[19],
				:golf => row[20],
				:soccer => row[21],
				:softball => row[22],
				:volleyball => row[23],
				:student_id => row[0],
			})



			StandardizedTest.create!({
				:convertedACT => row[71],
				:compositeACT => row[72],
				:officialACT => row[73],
				:englishACT => row[74],
				:mathACT => row[75],
				:socialACT => row[76],
				:naturalACT => row[77],
				:toefl => row[78],
				:gre => row[79],
				:gmat => row[80],
				:mat => row[81],
				:lsat => row[82],
				:compositeSAT => row[66],
				:officialSAT => row[67],
				:mathSAT => row[68],
				:readingSAT => row[69],
				:writingSAT => row[70],
				:student_id => row[0],
			})

			StudentDetail.create!({
				:sex => row[7],
				:maritalStatus => row[8],
				:usCitizen => row[9],
				:citizenship => row[10],
				:ethnicity => row[11],
				:race => row[12],
				:athlete => row[15],
				:dateOfBirth => row[37],
				:primaryEmail => row[59],
				:deceased => row[65],
				:churchType => row[119],
				:graduated => row[28],
				:firstName => row[1],
				:middleName => row[2],
				:lastName => row[3],
				:preferredName => row[4],
				:title => row[5],
				:suffix => row[6],
				:level => row[47],
				:student_id => row[0],
			})

			HighSchool.create!({
				:ceebHS => row[101],
				:nameHS => row[102],
				:typeHS => row[103],
				:gpaHS => row[104],
				:percentageHS => row[105],
				:rankHS => row[106],
				:sizeHS => row[107],
				:gradYearHS => row[108],
				:student_id => row[0],
			})

			Major.create!({
				:majorType => row[34],
				:majorFullName => row[50],
				:advisor => row[36],
				:majorShortName => row[48],
				:assocMajor => row[51],
				:undergradMajorOne => row[52],
				:undergradMajorTwo => row[53],
				:undergradMajorThree => row[54],
				:undergradMinorOne => row[55],
				:undergradMinorTwo => row[56],
				:graduateMajor => row[57],
				:student_id => row[0],
			})

		end
	end


	def self.StudentDetail
		StudentDetail
			.select('student_details.sex, student_details.race')
	end

	def self.undergraduatebyclassificationAndGender
		Student
			.select('student_details.sex, student_hours.undergradQualityHours, student_hours.program')
			.joins(:student_hour)
			.joins(:student_detail)
  end

	def self.graduatebyclassificationAndGender
		Student
			.select('student_details.sex, majors.majorType')
			.joins(:major)
			.joins(:student_detail)
	end

	def self.udlbyClassificationandGender
		Student
			.select('student_details.sex, student_hours.program, student_hours.undergradQualityHours')
			.joins(:student_hour)
			.joins(:student_detail)
	end

	def self.ualbyCollege
		Student
			.select('colleges.name, student_hours.program')
			.joins(:major)
			.joins(:student_hour)
			.joins("INNER JOIN degrees ON degrees.name = majors.majorFullName")
			.joins("INNER JOIN departments ON departments.id = degrees.department_id")
			.joins("INNER JOIN colleges ON colleges.id = departments.college_id")
	end

	def self.dateOfCreated
		Student
			.select("students.id, strftime('%Y-%m-%d', students.created_at) as Year")
			.group("strftime('%Y-%m-%d', students.created_at)")
	end

	def self.studentEnrollment
		Attendance
			.select('attendances.firstYear, student_hours.program, majors.majorType')
			.joins("INNER JOIN student_hours ON student_hours.student_id = attendances.student_id")
			.joins("INNER JOIN majors ON majors.student_id = attendances.student_id")
	end


end