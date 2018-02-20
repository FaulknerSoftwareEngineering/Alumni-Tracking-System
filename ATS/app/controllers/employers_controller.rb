=begin 
  Created by:Javan Rampersad, Christopher Smith
  On: February 20, 2018
=end
class EmployersController < ApplicationController
    def index
        @employers = Employer.all
    end
end