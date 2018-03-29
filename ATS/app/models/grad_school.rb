class GradSchool < ActiveRecord::Base
    belongs_to :student
    has_one :university
end
