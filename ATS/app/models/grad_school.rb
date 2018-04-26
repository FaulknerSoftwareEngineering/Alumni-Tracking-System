class GradSchool < ActiveRecord::Base
    belongs_to :student
    has_one :university
    after_initialize :default_values
    
  
    def university_name
        return University.find(self.university_id).name
    end
    def student_name
        student = Student.find(self.student_id)
        return student.first_name + " " + student.last_name  
    end
    def degree_type
        return DegreeType.find(self.higher_degree_type).name
    end
    
    private
    def default_values
      self.applied ||= false
      self.accepted ||= false
    end
end
