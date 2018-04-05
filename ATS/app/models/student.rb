
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

#Ethan Widen 3/27/18
class Student < ActiveRecord::Base
    has_many :employments, dependent: :destroy
    has_many :grad_schools
    has_many :degrees
    has_many :addresses, dependent: :destroy
    has_many :earned_degrees, dependent: :destroy
    
    def self.students_in_department(role)
        #byebug
        return Student.all
    end
end
