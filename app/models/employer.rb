=begin
Created by: Javan Rampersad, Christopher Smith
On: 20 Feb 2018
=end
class Employer < ActiveRecord::Base
    has_many :employments
    validates :name, :presence => true
    #validates :number
    #validates :email
end