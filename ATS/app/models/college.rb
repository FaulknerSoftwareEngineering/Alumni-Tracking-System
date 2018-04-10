class College < ActiveRecord::Base
    has_many :departments
    validates :name, :presence => true
end
