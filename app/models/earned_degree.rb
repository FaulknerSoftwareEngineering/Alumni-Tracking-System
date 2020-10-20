class EarnedDegree < ActiveRecord::Base
    belongs_to :student
    belongs_to :degree
    
    def self.grad_seasons
       %w(Spring Summer Fall)
    end
    
    
    def degree_name
        begin degree = Degree.find(self.degree_id)
            return degree.name
        rescue ActiveRecord::RecordNotFound
        end
    end
    
    def first_name
        return Student.find(self.student_id).first_name
    end
    
    def last_name
        return Student.find(self.student_id).last_name
    end
    
    def first_name_order
        return Student.find(self.student_id).first_name.downcase
    end
    def last_name_order
        return Student.find(self.student_id).last_name.downcase
    end
end
