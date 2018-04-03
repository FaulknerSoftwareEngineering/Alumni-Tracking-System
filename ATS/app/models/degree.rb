class Degree < ActiveRecord::Base
    belongs_to :department
    has_many :earned_degree
end