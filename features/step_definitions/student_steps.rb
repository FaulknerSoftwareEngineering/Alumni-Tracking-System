Given /the following students exist/ do |students_table|
 students_table.hashes.each do |student|
    @student = Student.create!(student)
    Address.create!(student_id: @student.id)
  end #this doesn't seem to work, or at least nothing is showing up
end


Given /the following reports exist/ do |reports_table|
reports_table.hashes.each do |m|
         #@Report = Report.create!(report)
        m.each { |first,last,degree,year|
            # still not working, year_graduated only seems to be in html and the students_controller
            @Student = Student.create!(first_name: "#{first}", last_name: "#{last}")
            #@Degree = @EarnedDegree.degree.create!(degree_name: "#{degree}", year_graduated: "#{year}")
            # I can't figure out how to create a student and earned degree and have them linked
            # The manual adding of each Alumni through the HTML file seems to do it for you
            # I worked on this for so long but have gotten nowhere, the models do not seem to work together well
            #@Degree = Degree.create!(name: "#{degree}", year_graduated: "#{year}")
            #@EarnedDegree = @Student.earned_degrees.degree.create!(degree_name: "#{degree}", year_graduated: "#{year}")
            #@Degree.student_id = @Student.student_id
            }
     end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
    body = page.body
    
    expect(body.index(e1)).to be < body.index(e2)
    
    
end