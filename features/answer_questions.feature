Feature: Answering questions
  In order to play the game
  As a User
  I want to answer a question
  And be told if I am right

  Scenario: Viewing an individual question page
    Given I am on the page for the blue sky question
    Then I should see "Is the sky blue?"

  Scenario: Answering a question correctly
    Given I have already signed up
    And I am on the page for the blue sky question
    When I press "True"
    Then I should see "Correct"

  Scenario: Answering a question incorrectly
    Given I have already signed up
    And I am on the page for the blue sky question
    When I press "False"
    Then I should see "Incorrect"

   Scenario: Tracking an answered question
     Given I have already signed up
     When I answer a question
     Then my answer should be tracked in the database

  Scenario: Not seeing an answered question
    Given I have already signed up
    And there is only one question in the database
    When I answer that question
    Then I should see "No questions yet, sorry."

