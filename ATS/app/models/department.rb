class Department < ActiveRecord::Base
    has_many :degree
    has_many :user
    belongs_to :college
end
