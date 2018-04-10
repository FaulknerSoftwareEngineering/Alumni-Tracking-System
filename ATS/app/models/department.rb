class Department < ActiveRecord::Base
    has_many :degrees
    has_many :user
    belongs_to :college
    validates :name, :presence => true

end
