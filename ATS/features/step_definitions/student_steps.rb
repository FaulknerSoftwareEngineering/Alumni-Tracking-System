Given /the following students exist/ do |students_table|
 students_table.hashes.each do |student|
    Student.create!(student)
  end
end