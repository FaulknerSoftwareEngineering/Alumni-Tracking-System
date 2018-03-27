# Christopher Smith 03/24/18
Feature: add universities

	As a User
	I want to be able to add universities
	In order to connect and group universities to the proper student

Background:
	Background: Preexisting Universities
	Given the following Universities exist:
	|title	|
	|Faulkner University	|
	|Alabama State University	|


Scenario: Add a University
	Given I am on the "Add University page"
	When I fill in the "Universiy Name" field with "Auburn University at Montgomery"
	And I click "Add University"
	Then the list of universities should include "Auburn University at Montgomery"


Scenario: Attempt to add a prexisting University
	Given I am on the "Add University" page
	When I fill in the "Universiy Name" field with "Faulkner University"
	And I click "Add University"
	Then I should see "Faulkner University already exists"
	And the list of universities should only have one instance of "Faulkner University"


Scenario: Attempt to add a university with an invalid name
	Given I am on the "Add University" page
	When I fill in the "Universiy Name" field with ""
	And I click "Add University"
	Then I should see "University Name cannot be empty"
	And the list of universities should not include ""