# Christopher Smith 03/24/18
Feature: Update Universities

	As a user
	I want to update the information regarding universities
	In order to change the names of universities when necessary

Background: Preexisting Universities
	Given the following Universities exist:
	|title	|
	|Faulkner University	|
	|Alabama State University	|

Scenario: Navigate to university update page
	Given I am on the "Universities Index" page
	When I click "Update information for Faulkner University"
	Then I should be on the "Update University" page
	And I should see "Faulkner University"


Scenario: Update a university
	Given I am on the "Update University" page for "Faulkner University"
	When I fill in the "University Name" field with "Faulkner Christian University"
	And I click "Update University"
	Then I should be on the "Universities Index" page
	And I should see "Faulkner Christian University"
	And I should not see "Faulkner University"


Scenario: Attempt to update a university with a prexisting name
	Given I am on the "Update University" page for "Faulkner University"
	When I fill in the "University Name" field with "Alabama State University"
	And I click "Update University"
	Then I should see "That name already exists"
	And the list of universities should include "Faulkner University"