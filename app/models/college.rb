class College < ActiveRecord::Base
    has_many :departments
    has_many :user_colleges
    has_many :users, :through => :user_colleges
    validates :name, :presence => true
end
