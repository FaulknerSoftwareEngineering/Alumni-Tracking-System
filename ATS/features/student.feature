Feature: create and edit students

  As a user
  So that I can update information in the system
  I want to include students
  
  Background: students in database
    Given the following students exist:
    | first_name  | last_name | date_of_birth|
    | Zack        | Pace      |   1996-08-25 |
    | Jon         | Doe       |   1982-06-25 |
  
  
    Scenario: add students to database
        Given I am on the home page
        And I follow "Add new student"
        And  I fill in "First Name" with "Jack"
        And I press "Save Changes"
        Then I should be on the home page
        And I should see "Jack"
    
    Scenario: edit student information
        Given I am on the edit page for "Zack"
        And  I fill in "First Name" with "AAA"
        And  I press "Save Changes"
        Then I am on the details page for "AAA"
        And I should see "AAA"
      
    Scenario: remove student from database
        Given I am on the details page for "Zack"
        And  I press "Delete"
        Then  I should be on the home page
        And I should not see "Zack"