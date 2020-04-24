#Made by Zachery Tomlin and Mason Simonton April 2020
Feature: view report
    As a user
    I want to be able to view the reports on Alumni

Background: reports in database 
    Given the following students exist:
     | first_name | last_name  | student_id  | 
     | Donna      | Stone      | 51957       | 
     | James      | Anderson   | 84880       | 
     | David      | Nelson     | 62321       | 
     
     And the following degree types exist
     | name      | 
     | Bachelors | 
     
     And the following degrees exist
     | name         | degree_type_id | 
     | BioChemistry |      1         | 
     | Accounting   |      1         | 
     | Informatics  |      1         |  
     
     And the following earned degrees exist
     | student_id  | degree_id |
     | 51957       |     1     |
     | 84880       |     2     |
     | 62321       |     3     |
     
Scenario: Attempt to view any reports
    Given I am on the report filter page
    Then I should see "By Degree"
    And I press "Generate Report"
    Then I am on the report result page 
    And I should see "Donna"
    And I should see "James"
    And I should see "David"

Scenario: Filtering by Degree
    Given I am on the report filter page
    And I select "BioChemistry" from "earned_degree_degree_id"
    And I press "Generate Report"
    Then I am on the report result page
    And I should see "Donna"
    And I should not see "David"
    
Scenario: Filtering by Graduation Year
    Given I am on the report filter page
    And I select "2015" from "earned_degree_year_graduated"
    And I press "Generate Report"
    Then I am on the report result page 