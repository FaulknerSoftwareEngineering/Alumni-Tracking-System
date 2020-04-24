Given /the following students exist/ do |students_table|
 students_table.hashes.each do |student|
    @student = Student.create!(student)
    Address.create!(student_id: @student.id)
  end 
end

# edited by Zachery Tomlin April 2020
Given /the following degrees exist/ do |degrees_table|
    degrees_table.hashes.each do |degree|
        @degree = Degree.create!(degree)
    end
end

Given /the following earned degrees exist/ do |earned_table|
    earned_table.hashes.each do |earned|
        @earned_degree = EarnedDegree.create!(earned)
        #EarnedDegree.create!(earned)
    end
end

Given /the following degree types exist/ do |degree_types_table|
    degree_types_table.hashes.each do |type|
        @degree_types = DegreeType.create!(type)
    end
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
    body = page.body
    
    expect(body.index(e1)).to be < body.index(e2)
    
    
end