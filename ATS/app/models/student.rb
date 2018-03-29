=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end
class Student < ActiveRecord::Base
    has_many :employers
    has_many :degrees
    has_many :universities
    has_many :departments
end
