#Ethan Widen 3/26/17
Feature: An actor can only access certain parts of the system
  
Background: users in database
  
  Given the following users exist:
    | email                           | name              | uid       | oauth_token | oauth_expires_at
    | ethan.widen@faulkner.edu        | Ethan Widen       | 372979595 | 9iBCBogYr5q | 2018-03-18 20:19:42 UTC
    | christopher.smith@faulkner.edu  | Christopher Smith | 890200697 | XfDwPXSZFfG | 2018-03-19 20:19:42 UTC
    | amanda.burton@faulkner.edu      | Amanda Burton     | 469071135 | 3UtY59fDLjc | 2018-03-20 20:19:42 UTC
    | zack.pace@faulkner.edu          | Zack Pace         | 978003783 | NgFMp7vrGc8 | 2018-03-21 20:19:42 UTC
  
Scenario: an actor with no account cannot login
  
Scenario: an actor with an account can login