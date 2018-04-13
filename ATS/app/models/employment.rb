class Employment < ActiveRecord::Base
    has_one :employer
    belongs_to :student
    after_initialize :default_values
    
    def student_name
        student = Student.find(self.student_id)
        return student.first_name + " " + student.last_name 
    end
    def employer_name
        return Employer.find(self.employer_id).name
    end
    private
    def default_values
      self.current_job ||= false
      self.in_field ||= false
    end
end
