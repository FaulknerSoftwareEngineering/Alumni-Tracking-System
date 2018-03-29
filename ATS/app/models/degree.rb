class Degree < ActiveRecord::Base
    belongs_to :department
    belongs_to :student
end