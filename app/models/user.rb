# Ethan Widen 2/20/18
class User < ActiveRecord::Base
    has_many :user_colleges
    has_many :user_departments
    has_many :colleges, :through => :user_colleges
    has_many :departments, :through => :user_departments
    belongs_to :role
    def self.from_omniauth(auth)
        user = User.where(email: auth.info.email, name: auth.info.name).first
        if !user.blank?
            user.provider = auth.provider
            user.uid = auth.uid
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
            return user
        else
            return false
        end
    end
end
