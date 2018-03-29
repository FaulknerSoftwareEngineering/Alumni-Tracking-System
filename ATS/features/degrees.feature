# Amanda Burton
Feature: search for students by degrees
 
  As a user
  So that I can find students with certain degree types
  I want to include and search on degree information in students I enter
 
Background: degrees in database
 
  Given the following movies exist:
  | Degree                          | Department 
  | Computer Science                | Arts and Sciences
  | Computer Infromatics Science    | Arts and Sciences
  | Biology                         | Arts and Sciences
  | Music                           | Arts and Sciences
 
Scenario: add degree to university
  When I go to the "Add Degree to University" page
  And  I fill in "Degree" with "Accounting"
  And  I choose "Business" in "Department"
  And  I press "Update Degree Info"
  Then the director of "Degree" should be "Accounting"
 
Scenario: find students with same degree
  Given I am on the details page for "Computer Science"
  When  I follow "Find Students With Same Degree"
  Then  I should be on the Similar Students page for "Computer Science"
  And   I should see "Amanda Burton"
  But   I should not see "John Doe"
 
Scenario: find multiple degrees for same student
  Given I am on the details page for "Amanda Burton"
  And   I press "Show Degrees"
  Then  I should not see "Business"
  And   I should see "Computer Science" and "Music"