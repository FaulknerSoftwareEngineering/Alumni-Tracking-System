
=begin 
    Created by Zack Pace
    on: March 23, 2018 
=end

#Ethan Widen 3/27/18
class Student < ActiveRecord::Base
    has_many :employments, dependent: :destroy
    has_many :grad_schools
    has_many :degrees, :through => :earned_degrees
    has_many :addresses, dependent: :destroy
    has_many :earned_degrees, dependent: :destroy
		has_one :student_remedial, dependent: :destroy
		has_one :student_housing, dependent: :destroy
		has_one :student_tuition, dependent: :destroy
		has_one :student_veteran, dependent: :destroy
		has_one :student_hour, dependent: :destroy
		has_one :attendance, dependent: :destroy
		has_one :athlete, dependent: :destroy
		has_one :standardized_test, dependent: :destroy
		has_one :student_detail, dependent: :destroy
		has_one :high_school, dependent: :destroy
		has_one :major, dependent: :destroy
    validates :first_name, :presence => true;
    validates :last_name, :presence => true;
    
    def self.accessible_students(role, user)
        if !(Rails.env.development? || Rails.env.test?)
            case role
                when 1, 5
                    return Student.all
                when 2
                    @user_college = UserCollege.find_by_user_id(user)
                    if @user_college
                        @college = College.find_by_id @user_college.college_id
                        @departments = Department.find_by_college_id @college
                        @degrees = Degree.find_by_department_id @departments
                        @earned_degree_student_ids = EarnedDegree.where(degree_id: @degrees).pluck(:student_id)
                        return Student.where(id: @earned_degree_student_ids)
                    else
                        return nil
                    end
                when 3
                    @user_department = UserDepartment.find_by_user_id(user)
                    if @user_department
                        @department = Department.find_by_id(@user_department.department_id)
                        @earned_degree_student_ids = EarnedDegree.where(degree_id: @department.degrees).pluck(:student_id)
                        return Student.where(id: @earned_degree_student_ids)
                    else
                        return nil
                    end
                when 4
                    #Not sure about AAs, maybe aggregating the two together?
            end
        else
            return Student.all
        end
    end
    
    
    
    
end
