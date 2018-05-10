class Form < ActiveRecord::Base
    has_one :section1
    has_one :section2 
    has_one :section3
    has_one :section3animal
    has_one :section4
    has_one :section4animal
    has_one :section5
    has_many :researcher
end
