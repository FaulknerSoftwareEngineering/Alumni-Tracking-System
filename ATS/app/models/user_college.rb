class UserCollege < ActiveRecord::Base
    belongs_to :college
    belongs_to :user
end
