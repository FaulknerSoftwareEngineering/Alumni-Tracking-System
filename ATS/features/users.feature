#Ethan Widen 3/17/18
Feature: Users can be Created, Read, and Updated
  
Background: users in database
  
  Given the following users exist:
    | email                           | name              | uid       | oauth_token | oauth_expires_at
    | ethan.widen@faulkner.edu        | Ethan Widen       | 372979595 | 9iBCBogYr5q | 2018-03-18 20:19:42 UTC
    | christopher.smith@faulkner.edu  | Christopher Smith | 890200697 | XfDwPXSZFfG | 2018-03-19 20:19:42 UTC
    | amanda.burton@faulkner.edu      | Amanda Burton     | 469071135 | 3UtY59fDLjc | 2018-03-20 20:19:42 UTC
    | zack.pace@faulkner.edu          | Zack Pace         | 978003783 | NgFMp7vrGc8 | 2018-03-21 20:19:42 UTC
  
Scenario: confirm defined users exist
  When I am on the users table page
  Then I should see "Amanda Burton"
  And I should see "978003783"

Scenario: add user
  When I go to the home page
  When I follow "Users"
  Then I am on the users table page
  When I follow "Add new user"
  Then I am on the new user page
  Then I fill in the following:
    | Provider    | google_oauth2 |
    | Uid         | 342524532 |
    | oauth_token | 9adfavbfdas |
    | Email       | ethan.widen@faulkner.edu |
    | Name        | Ethan Widen |
  And I press "Submit"
  Then I should be on the users table page
  And I should see "Ethan Widen"
  And I should see "342524532"
  
Scenario: edit user
  When I go to the users table page
  Then I follow "Edit Ethan Widen"
  Then I am on the edit user page for "Ethan Widen"
  Then I fill in the following:
    | Provider    | google_oauth2 |
    | Uid         | 565635463456 |
    | oauth_token | agsfg56345fdg |
    | Email       | edwiden96@gmail.com |
    | Name        | Ethan Widen |
  And I press "Submit"
  Then I should be on the users table page
  And I should see "Ethan Widen"
  And I should see "edwiden96@gmail.com"
  And I should see "565635463456"
  