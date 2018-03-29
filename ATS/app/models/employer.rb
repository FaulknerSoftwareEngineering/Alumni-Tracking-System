=begin
Created by: Javan Rampersad, Christopher Smith
On: 20 Feb 2018
=end
class Employer < ActiveRecord::Base
    belongs_to :student
    
end