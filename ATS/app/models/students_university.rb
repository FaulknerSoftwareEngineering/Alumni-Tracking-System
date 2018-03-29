class Students_university < ApplicationRecord
    belongs_to :student
    belongs_to :university
end