Feature: User profiles
  In order to track my progess
  As a User
  I want to my score on my profile page

  Scenario: Viewing the profile page
    Given I have already signed up
    And I have answered a question
    When I go to my profile
    Then I should see my username
    And I should see my score