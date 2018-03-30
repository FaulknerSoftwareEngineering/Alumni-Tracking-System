Feature: Sort the students table
  As a user
  So that I can see students more organized
  I want to be able to sort on all fields on the student home page.
  
  Background: students in database
    Given the following students exist:
    | first_name  | last_name |
    | Zack        | Pace      |
    | Jon         | Doe       |
    
      And I am on the student home page
    
    
    Scenario: Sort On first Name
        When I follow "First Name"
        Then I should see "Jon" before "Zack"
     
    Scenario: Sort On Last Name
        When I follow "Last Name"
        Then I should see "Doe" before "Pace"
        
    Scenario: Sort On Degree
        When I follow "Degree"
        Then I should see "Computer Science" before "English"
        
    Scenario: Sort On Grad Year
        When I follow "Grad Year"
        Then I should see "2016" before "2018"
        
    Scenario: Sort On Grad Term
        When I follow "Grad Term"
        Then I should see "Spring" before "Fall"    