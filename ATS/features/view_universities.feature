# Christopher Smith 03/24/18
Feature: view universities
	As a User
	I want to be able to view universities
	In order to know what universities our students are connected to

Background:
	Background: Preexisting Universities
	Given the following Universities exist:
	|title	|
	|Faulkner University	|
	|Alabama State University	|

Scenario:
	Given I am on the "Universities Index" page
	I should see "Faulkner University"
	And I should see "Alabama State University"