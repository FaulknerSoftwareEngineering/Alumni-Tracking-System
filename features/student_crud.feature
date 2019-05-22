Feature: create and edit students

  As a user
  So that I can update information in the system
  I want to include students
  
  Background: students in database
    Given the following students exist:
    | first_name  | last_name |
    | Zack        | Pace      |
    | Jon         | Doe       |
  
  
    Scenario: add students to database
        Given I am on the student home page
        And I follow "Add new student"
        And  I fill in "First Name" with "Jack"
        And I fill in "Cell Phone" with "123-456-7890"
        And I press "Save Changes"
        Then I should be on the student home page
        And I should see "Jack"
    
    Scenario: edit student information
        Given I am on the edit student page for "Zack"
        And  I fill in "First Name" with "AAA"
        And  I press "Save Changes"
        Then I am on the student details page for "AAA"
        And I should see "AAA"
      
    Scenario: remove student from database
        Given I am on the student details page for "Zack"
        And  I press "Delete"
        Then  I should be on the student home page
        And I should not see "Zack"
        
    Scenario: View details page for a student
      Given I am on the student home page
      And I follow "More about Zack"
      Then I should be on the student details page for "Zack"
      
    