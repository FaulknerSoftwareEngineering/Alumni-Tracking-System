class EarnedDegree < ActiveRecord::Base
    belongs_to :student
    belongs_to :degree
end
