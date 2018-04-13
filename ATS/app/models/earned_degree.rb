class EarnedDegree < ActiveRecord::Base
    belongs_to :student
    belongs_to :degree
    
    def self.grad_seasons
       %w(Spring Summer Fall)
    end
    
    
    def degree_name
        degree = Degree.find(self.degree_id)
        return degree.name
    end
    
    def first_name
        return Student.find(self.student_id).first_name
    end
    
    def last_name
        return Student.find(self.student_id).last_name
    end
end
