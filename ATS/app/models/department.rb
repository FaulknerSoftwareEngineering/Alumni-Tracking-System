class Department < ActiveRecord::Base
    has_many :degree
    belongs_to :college
end
