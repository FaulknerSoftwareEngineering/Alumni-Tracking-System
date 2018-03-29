
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

#Ethan Widen 3/27/18
class Student < ActiveRecord::Base
    has_many :employers
    has_many :universities
    has_many :degrees

end
