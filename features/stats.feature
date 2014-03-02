Feature: Statistics
  In order to judge my overall progress
  As a user
  I want to be able to view statistics

  Scenario: Overall number of questions
    Given I have already signed up
    When I am on the statistics page
    Then I should see the number of questions

  Scenario: Hardest question
    Given I have already signed up
    And there are a number of other users who have answered questions
    When I am on the statistics page
    Then I should see the hardest question

  Scenario: Easiest question
    Given I have already signed up
    And all the questions have been answered by other users
    When I am on the statistics page
    Then I should see the easiest question