
Feature: view report
    As a user
    I want to be able to view the reports on Alumni

Background: reports in database 
    Given the following reports exist: 
     | first_name | last_name  | degree_name  | year_graduated |
     | Donna      | Stone      | BioChemistry | 2015           |
     | James      | Anderson   | Accounting   | 2012           |
     | David      | Nelson     | Informatics  | 2015           |

Scenario: Attempt to view any reports
    Given I am on the report filter page
    Then I should see "Degree"
    And I press "Generate Report"
    Then I am on the report result page 
    And I should see "Donna"
    And I should see "James"
    And I should see "David"

Scenario: Filtering by Degree
    Given I am on the report filter page
    And I select "BioChemistry" from "Degree"
    And I press "Generate Report"
    Then I should see "Donna"
    And I should not see "David"
    
Scenario: Filtering by Graduation Year
    Given I am on the report filter page
    And I select "2015" from "Graduation Year"
    And I press "Generate Report"
    Then I should see "Donna"
    And I should not see "James"