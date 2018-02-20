class UsersController < ApplicationController
    #Ethan Widen 2/20/18
    def index
        @users = User.all
    end
    
end
