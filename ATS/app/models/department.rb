class Department < ActiveRecord::Base
    has_many :degrees
    has_many :user_departments
    has_many :users, :through => :user_departments
    belongs_to :college
    validates :name, :presence => true

end
