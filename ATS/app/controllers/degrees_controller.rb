class DegreesController < ApplicationController
=begin 
    Created by Zack Pace & Amanda Burton
    on: Feburary 20, 2018 
=end
    def index
        @degrees = Degree.all
    end
end
