class EarnedDegree < ActiveRecord::Base
    belongs_to :student
    belongs_to :degree
    
    def self.grad_seasons
       %w(Spring Summer Fall)
    end
end
