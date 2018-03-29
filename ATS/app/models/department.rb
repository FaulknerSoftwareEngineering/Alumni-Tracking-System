class Department < ActiveRecord::Base
    has_many :degrees
    belongs_to :college
end
