class EarnedDegree < ActiveRecord::Base
    belongs_to :student
    belongs_to :degree
    
    def self.grad_seasons
       %w(Spring Summer Fall)
    end
    
    
    def self.degree_name
        degree = Degree.find(self.degree_id)
        return degree.name
    end
    
    def self.first_name
        byebug
        return Student.find(self.student_id).first_name
    end
    
    def self.last_name
        return Student.find(self.student_id).last_name
    end
    
    def self.first_name_order
        return Student.find(self.student_id).first_name.downcase
    end
    def self.last_name_order
        return Student.find(self.student_id).last_name.downcase
    end
end
