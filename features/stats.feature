Feature: Statistics
  In order to judge my overall progress
  As a user
  I want to be able to view statistics

  Scenario: Overall number of questions
    Given I have already signed up
    When I am on the statistics page
    Then I should see the number of questions