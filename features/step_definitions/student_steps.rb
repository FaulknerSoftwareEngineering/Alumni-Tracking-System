Given /the following students exist/ do |students_table|
 students_table.hashes.each do |student|
    @student = Student.create!(student)
    Address.create!(student_id: @student.id)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
    body = page.body
    
    expect(body.index(e1)).to be < body.index(e2)
    
    
end