class InstituationalResearchController < ApplicationController
    # Ian Chen 4/8/2019
    def index
    end
    
    def user
        @user = User.all
    end

    
end