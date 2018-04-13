class GradSchool < ActiveRecord::Base
    belongs_to :student
    has_one :university
    after_initialize :default_values

  
    def university_name
        return University.find(self.university_id).name
    end
    private
    def default_values
      self.applied ||= false
      self.accepted ||= false
    end
end
