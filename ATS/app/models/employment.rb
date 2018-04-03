class Employment < ActiveRecord::Base
    has_one :employer
    belongs_to :student
end
