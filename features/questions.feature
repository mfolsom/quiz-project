Feature: Questions

@random
Scenario: seeing a question
  When I am on the homepage
  Then I should see the first question

Scenario: seeing a second question
  Given I am on the homepage
  And I complete a question
  When I click "Next"
  Then I should be on the homepage

  Scenario: seeing a new question
  Given I am on the homepage
  And I complete a question
  When I click "Next"
  Then I should not see the question I just answered
