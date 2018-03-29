=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end
class Student < ActiveRecord::Base
    has_many :employers
end
