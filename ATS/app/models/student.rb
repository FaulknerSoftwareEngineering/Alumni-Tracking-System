
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

#Ethan Widen 3/27/18
class Student < ActiveRecord::Base
    has_many :employments, dependent: :destroy
    has_many :grad_schools
    has_many :degrees
    has_many :addresses, dependent: :destroy
    has_many :earned_degrees, dependent: :destroy
    
    def self.accessible_students(user, role)
        @user = User.find(user)
        @role = Role.find(role)
        case @role.id
            when 1, 5
                return Student.all
            when 2
                byebug
                @departments = Department.where(college_id: @user.user_colleges.pluck(:college_id)).pluck(:id)
            when 3, 4
                @departments = @user.user_departments.pluck(:department_id)
        end
        # if !@role.user_colleges.blank?
        #     @colleges = College.where(id: @user.user_college_ids).pluck(:id)
        #     @departments = Department.where(college_id: @colleges).pluck(:id)
        # else
        #     if !@user.user_departments.blank?
        #         byebug
        #         @departments = Department.where(college_id:@user.user_departments_ids).pluck(:id)
        #     else
        #         return Student.all
        #     end
        # end
        
        #byebug
        @degrees = Degree.where(department_id: @departments).pluck(:id)
        @earned_degrees = EarnedDegree.where(degree_id: @degrees).pluck(:student_id)
        return Student.where(id: @earned_degrees)
    end
    
    
    validates :first_name, :presence => true;
    validates :last_name, :presence => true;
    
end
