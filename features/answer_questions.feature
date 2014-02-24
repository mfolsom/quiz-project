Feature: Answering questions
  In order to play the game
  As a User
  I want to answer a question
  And be told if I am right

  Scenario: Viewing an individual question page
    Given I am on the page for the blue sky question
    Then I should see "Is the sky blue?"

  Scenario: Answering a question correctly
    Given I am on the page for the blue sky question
    When I press "true"
    Then I should see "Correct"