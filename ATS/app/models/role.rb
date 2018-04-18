class Role < ActiveRecord::Base
    #Ethan Widen - 3/28/18
    has_many :users
end
