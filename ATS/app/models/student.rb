
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

#Ethan Widen 3/27/18
class Student < ActiveRecord::Base
    has_many :employments
    has_many :grad_schools
    has_many :degrees
    has_many :addresses
end
